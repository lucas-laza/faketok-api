import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Visionnage } from './visionnage.entity';

@Injectable()
export class VisionnageService {
  constructor(
    @InjectRepository(Visionnage)
    private visionnageRepository: Repository<Visionnage>,
  ) {}

  async watchVideo(
    videoId: number,
    userId: number,
    watchedPrct: number,
    watchedInSeconds: number,
    hasLiked: boolean,
    notInterested: boolean,
  ): Promise<Visionnage> {
    let visionnage = await this.visionnageRepository.findOne({
      where: { video: { id: videoId }, user: { id: userId } },
    });

    if (!visionnage) {
      visionnage = this.visionnageRepository.create({
        video: { id: videoId },
        user: { id: userId },
        nb_views: 1,
        watched_prcnt: watchedPrct,
        watched_in_seconds: watchedInSeconds,
        has_liked: hasLiked,
      });
    } else {
      visionnage.watched_prcnt = Math.max(visionnage.watched_prcnt, watchedPrct);
      visionnage.watched_in_seconds = Math.max(visionnage.watched_in_seconds, watchedInSeconds);
      if (visionnage.watched_prcnt >= 0.01 && visionnage.watched_in_seconds >= 1) {
        visionnage.nb_views += 1;
      }
      if (visionnage.has_liked !== hasLiked) {
        visionnage.has_liked = hasLiked;
      }
    }

    visionnage.score = this.calculateScore(visionnage.nb_views, visionnage.watched_prcnt, visionnage.watched_in_seconds, visionnage.has_liked, notInterested);

    return this.visionnageRepository.save(visionnage);
  }

  private calculateScore(nbViews: number, watchedPrct: number, watchedInSeconds: number,  hasLiked: boolean, notInterested: boolean): number {
    
    if (notInterested) {
      return 0;
    }
    
    let viewPoints = 0;
    if (watchedPrct >= 0.01 && watchedInSeconds >= 1) {
      if (nbViews === 1) viewPoints = 1;
      else if (nbViews === 2) viewPoints = 7;
      else if (nbViews === 3) viewPoints = 12;
      else if (nbViews === 4) viewPoints = 18;
      else if (nbViews >= 5) viewPoints = 23;
    }
    
    let watchedPoints = 0;
    if (watchedPrct >= 0.93) watchedPoints = 10;
    else if (watchedPrct >= 0.75) watchedPoints = 9;
    else if (watchedPrct >= 0.5) watchedPoints = 8;
    else if (watchedPrct >= 0.35) watchedPoints = 7;
    else if (watchedPrct >= 0.25) watchedPoints = 6;
    else if (watchedPrct >= 0.17) watchedPoints = 5;
    else if (watchedPrct >= 0.1) watchedPoints = 3;
    else if (watchedPrct >= 0.05) watchedPoints = 2;
    else if (watchedPrct >= 0.03) watchedPoints = 1;

    let secondsPoints = 0;
    if (watchedInSeconds >= 90) secondsPoints = 20;
    else if (watchedInSeconds >= 60) secondsPoints = 15;
    else if (watchedInSeconds >= 45) secondsPoints = 14;
    else if (watchedInSeconds >= 35) secondsPoints = 13;
    else if (watchedInSeconds >= 27) secondsPoints = 12;
    else if (watchedInSeconds >= 23) secondsPoints = 9;
    else if (watchedInSeconds >= 18) secondsPoints = 8;
    else if (watchedInSeconds >= 15) secondsPoints = 7;
    else if (watchedInSeconds >= 12) secondsPoints = 6;
    else if (watchedInSeconds >= 9) secondsPoints = 3;
    else if (watchedInSeconds >= 6) secondsPoints = 2;
    else if (watchedInSeconds >= 3) secondsPoints = 1;

    const likePoints = hasLiked ? 10 : 0;

    return Math.min(viewPoints + watchedPoints + secondsPoints + likePoints, 30);
  }
}