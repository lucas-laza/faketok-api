import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Visionnage } from './visionnage.entity';
import { Video } from './video.entity';
import { User } from './user.entity';

@Injectable()
export class RecommendationService {
  constructor(
    @InjectRepository(Visionnage)
    private visionnageRepository: Repository<Visionnage>,
    
    @InjectRepository(Video)
    private videoRepository: Repository<Video>,

    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async recommandVideos(userId: number): Promise<(Video | { ended: boolean; animal: string })[]> {
    const delta = 0.3;

    console.log(`Début de la recommandation pour l'utilisateur : ${userId}`);
    
    // 1. Récupérer les 10 dernières vidéos visionnées
    const lastWatchedVideos = await this.visionnageRepository.find({
      where: { user: { id: userId } },
      relations: ['video', 'video.tags'],
      order: { id: 'DESC' },
      take: 10,
    });
    console.log(`Vidéos visionnées récemment (${lastWatchedVideos.length}) :`, lastWatchedVideos);

    const user = await this.userRepository.findOne({ where: { id: userId } });
    if (!user) {
      console.error('Utilisateur introuvable');
      throw new Error('User not found');
    }
    let userAlignment = user.user_alignment;
    console.log(`Alignement utilisateur actuel : ${userAlignment}`);

    if (lastWatchedVideos.length === 0) {
      console.log("Aucune vidéo regardée précédemment, récupération aléatoire.");
      const randomVideos = await this.videoRepository
        .createQueryBuilder('video')
        .leftJoinAndSelect('video.tags', 'tag')
        .where('tag.alignment BETWEEN :min AND :max', {
          min: Math.max(userAlignment - delta, 0),
          max: Math.min(userAlignment + delta, 1),
        })
        .orderBy('RAND()')
        .take(10)
        .getMany();
      console.log(`Vidéos retournées pour nouvel utilisateur : ${randomVideos.length}`);
      return randomVideos;
    }

    // 2. Calcul des scores
    const redVideos = lastWatchedVideos.filter((v) =>
      v.video.tags.some((tag) => tag.alignment < 0.5),
    );
    const blueVideos = lastWatchedVideos.filter((v) =>
      v.video.tags.some((tag) => tag.alignment > 0.5),
    );

    let redScoreAverage = 0;
    let blueScoreAverage = 0;

    if (redVideos.length > 0) {
      redScoreAverage =
        redVideos.reduce((sum, visionnage) => sum + (visionnage.score || 0), 0) / redVideos.length;
    }

    if (blueVideos.length > 0) {
      blueScoreAverage =
        blueVideos.reduce((sum, visionnage) => sum + (visionnage.score || 0), 0) / blueVideos.length;
    }

    console.log(`Score moyen vidéos rouges : ${redScoreAverage}`);
    console.log(`Score moyen vidéos bleues : ${blueScoreAverage}`);

    // 3. Vérification si expérience terminée
    if (redVideos.length === 0 || blueVideos.length === 0) {
      const presentScoreAverage = redVideos.length > 0 ? redScoreAverage : blueScoreAverage;
      const direction = redVideos.length > 0 ? -1 : 1;

      console.log(`Direction alignement : ${direction}`);
      const experienceEnd = await this.checkExperienceEnded(userId, direction);
      if (experienceEnd) {
        console.log('Expérience terminée :', experienceEnd);
        return [experienceEnd];
      }

      // Ajustement de l'alignement utilisateur
      if (presentScoreAverage > 20) userAlignment += 0.2 * direction;
      else if (presentScoreAverage > 12.5) userAlignment += 0.1 * direction;
      else if (presentScoreAverage > 10) userAlignment += 0.05 * direction;
      else if (presentScoreAverage > 5) userAlignment -= 0.1 * direction;
      else userAlignment -= 0.2 * direction;
    } else {
      const scoreDifference = blueScoreAverage - redScoreAverage;

      // Calculer l'ajustement en imposant un décalage minimum de 0.1 (1% en proportion)
      let alignmentAdjustment = scoreDifference / 100;

      // S'assurer que l'ajustement absolu est d'au moins 0.1 (1% en proportion)
      if (Math.abs(alignmentAdjustment) < 0.1) {
        alignmentAdjustment = 0.1 * Math.sign(alignmentAdjustment);
      }

      userAlignment += alignmentAdjustment;

      // Limiter l'alignement dans les bornes [0, 1]
      userAlignment = Math.min(Math.max(userAlignment, 0), 1);
    }

    userAlignment = Math.min(Math.max(userAlignment, 0), 1);
    console.log(`Alignement utilisateur mis à jour : ${userAlignment}`);

    // Mise à jour explicite dans la base de données
    user.user_alignment = userAlignment;
    await this.userRepository.save(user);
    console.log('Alignement utilisateur enregistré en base de données.');

    // 4. Recommandation des vidéos
    const recommendedVideos = await this.videoRepository
      .createQueryBuilder('video')
      .leftJoinAndSelect('video.tags', 'tag')
      .where('tag.alignment BETWEEN :min AND :max', {
        min: Math.max(userAlignment - delta, 0),
        max: Math.min(userAlignment + delta, 1),
      })
      .andWhere((qb) => {
        const subQuery = qb
          .subQuery()
          .select('visionnage.videoId')
          .from(Visionnage, 'visionnage')
          .where('visionnage.userId = :userId')
          .getQuery();
        return `video.id NOT IN ${subQuery}`;
      })
      .setParameter('userId', userId)
      .orderBy('RAND()')
      .take(10)
      .getMany();

    console.log(`Nombre de vidéos recommandées : ${recommendedVideos.length}`);
    return recommendedVideos;
  }

  // Méthode pour vérifier si l'expérience est terminée
  private async checkExperienceEnded(userId: number, direction: number): Promise<{ ended: boolean; animal: string } | null> {
    const totalVideosWatched = await this.visionnageRepository.count({
      where: { user: { id: userId } },
    });

    const extremeVideosCount = await this.visionnageRepository
      .createQueryBuilder('visionnage')
      .innerJoin('visionnage.video', 'video')
      .innerJoin('video.tags', 'tag')
      .where('visionnage.userId = :userId', { userId })
      .andWhere('tag.alignment = :alignment', { alignment: direction === -1 ? 0 : 1 })
      .getCount();

    console.log(`Total vidéos regardées : ${totalVideosWatched}`);
    console.log(`Vidéos extrêmes regardées : ${extremeVideosCount}`);

    const threshold = 25;
    const extremeThreshold = 10;

    if (totalVideosWatched >= threshold && extremeVideosCount >= extremeThreshold) {
      const animal = direction === -1 ? 'chat' : 'chien';
      console.log(`L'expérience est terminée, type : ${animal}`);
      return { ended: true, animal };
    }

    console.log('L\'expérience n\'est pas encore terminée.');
    return null;
  }
}
