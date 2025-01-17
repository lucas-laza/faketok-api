import { Entity, Column, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { User } from './user.entity';
import { Video } from './video.entity';

@Entity()
export class Visionnage {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User, (user) => user.visionnages)
  user: User;

  @ManyToOne(() => Video, (video) => video.visionnages)
  video: Video;

  @Column({ default: 0 })
  nb_views: number;

  @Column({ type: 'float', default: 0 })
  watched_prcnt: number;

  @Column({ type: 'float', default: 0 })
  watched_in_seconds: number;

  @Column({ default: false })
  has_liked: boolean;

  @Column({ type: 'float', nullable: true })
  score: number;
}
