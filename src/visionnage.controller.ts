import { Controller, Post, Body, Get, Req } from '@nestjs/common';
import { VisionnageService } from './visionnage.service';
import { RecommendationService } from './recommendation.service';
import { Visionnage } from './visionnage.entity';
import { Video } from './video.entity';
import { Request } from 'express';

@Controller('visionnage')
export class VisionnageController {
  constructor(
    private readonly visionnageService: VisionnageService,
    private readonly recommendationService: RecommendationService,
  ) {}

  @Post('watch')
  async watchVideo(
    @Body('video_id') videoId: number,
    @Body('watched_prct') watchedPrct: number,
    @Body('watched_in_seconds') watchedInSeconds: number,
    @Body('has_liked') hasLiked: boolean,
    @Body('not_interested') notInterested: boolean,
    @Req() req: Request, // On récupère req pour accéder à userId défini par le middleware
  ): Promise<Visionnage> {
    const userId = req['userId']; // Récupérer l'ID utilisateur ajouté par le middleware
    console.log('userId dans le contrôleur:', userId); // Vérifiez que userId est bien reçu
    return this.visionnageService.watchVideo(videoId, userId, watchedPrct, watchedInSeconds, hasLiked, notInterested);
  }

  @Get('recommend')
  async recommendVideos(@Req() req: Request): Promise<(Video | { ended: boolean; animal: string })[]> {
    const userId = req['userId'];
    return this.recommendationService.recommandVideos(userId);
  }
  

}
