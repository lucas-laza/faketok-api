import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from 'typeorm';
import { Video } from './video.entity';

@Entity()
export class Tag {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  code: string;

  @Column()
  name: string;

  @ManyToMany(() => Video, (video) => video.tags)
  @JoinTable()
  videos: Video[];

  @Column({
    type: 'float',
    default: 0.50,
    precision: 3,
    scale: 2,
  })
  alignment: number;
}
