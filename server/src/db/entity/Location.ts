import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { BaseEntity } from './BaseEntity';
import { Company } from './Company';

@Entity('locations')
export class Location extends BaseEntity {
  @PrimaryGeneratedColumn({
    name: 'location_id',
  })
  id: number;

  @ManyToOne(() => Company, (company) => company.id)
  @JoinColumn({ name: 'company_id' })
  company: Company;

  @Column({ name: 'company_id' })
  companyId: number;

  @Column()
  name: string;

  @Column()
  addr: string;
}
