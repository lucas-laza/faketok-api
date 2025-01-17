import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Visionnage } from './visionnage.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  browser_id: string;

  @OneToMany(() => Visionnage, (visionnage) => visionnage.user)
  visionnages: Visionnage[];

  @Column({
    type: 'float',
    default: 0.50,
    precision: 3,
    scale: 2,
  })
  user_alignment: number;
}
