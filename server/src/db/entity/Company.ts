import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { BaseEntity } from './BaseEntity';
import { User } from './User';

@Entity('companies')
export class Company extends BaseEntity {
  @PrimaryGeneratedColumn({
    name: 'company_id',
  })
  id: number;

  @Column()
  name: string;

  @Column()
  addr: string;

  @OneToMany(() => Company, (company) => company.id)
  users: User[];
}
