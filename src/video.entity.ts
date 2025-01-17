import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, OneToMany } from 'typeorm';
import { Tag } from './tag.entity';
import { Visionnage } from './visionnage.entity';

@Entity()
export class Video {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column()
  description: string;

  @Column()
  url: string;

  @Column({ default: 0 })
  views: number;

  @ManyToMany(() => Tag, (tag) => tag.videos)
  tags: Tag[];

  @OneToMany(() => Visionnage, (visionnage) => visionnage.video)
  visionnages: Visionnage[];
}
