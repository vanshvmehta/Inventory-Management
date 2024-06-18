import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';
import { BaseEntity } from './BaseEntity';

@Entity('items')
export class Item extends BaseEntity {
  @PrimaryGeneratedColumn({
    name: 'sku',
  })
  id: number;

  @Column()
  name: string;

  @Column()
  description: string;

  @Column()
  category: string;

  @Column({
    name: 'unit_type',
  })
  unitType: string;

  @Column({ type: 'json' })
  metadata: object;
}
