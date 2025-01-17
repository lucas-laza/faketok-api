import { Module, MiddlewareConsumer, RequestMethod } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { Video } from './video.entity';
import { Tag } from './tag.entity';
import { User } from './user.entity';
import { Visionnage } from './visionnage.entity';
import { RecommendationService } from './recommendation.service';
import { VisionnageService } from './visionnage.service';
import { VisionnageController } from './visionnage.controller';
import { UserService } from './user.service';
import { UserIdentifierMiddleware } from './user-identifier.middleware';
import { VideoController } from './video.controller';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: process.env.DB_HOST || 'localhost',
      port: parseInt(process.env.DB_PORT, 10) || 3306,
      username: process.env.DB_USERNAME || 'root',
      password: process.env.DB_PASSWORD || '',
      database: process.env.DB_NAME || 'tiktok',
      entities: [Video, Tag, User, Visionnage],
      synchronize: true,
    }),
    TypeOrmModule.forFeature([Video, Tag, User, Visionnage]),
  ],
  providers: [RecommendationService, VisionnageService, UserService],
  controllers: [VisionnageController, VideoController],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(UserIdentifierMiddleware)
      .forRoutes(
        { path: 'visionnage/recommend', method: RequestMethod.GET },
        { path: 'visionnage/watch', method: RequestMethod.POST }
      );
  }
}
