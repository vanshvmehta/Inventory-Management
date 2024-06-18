import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { BaseEntity } from './BaseEntity';
import { Company } from './Company';

@Entity('users')
export class User extends BaseEntity {
  @PrimaryGeneratedColumn({
    name: 'user_id',
  })
  id: number;

  @ManyToOne(() => Company, (company) => company.id)
  @JoinColumn({ name: 'company_id' })
  company: Company;

  @Column()
  username: string;

  @Column()
  password: string;

  @Column()
  salt: string;

  @Column()
  email: string;

  @Column()
  firstname: string;

  @Column()
  surname: string;

  @Column()
  role: string;
}
