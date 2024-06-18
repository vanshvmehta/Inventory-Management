import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { BaseEntity } from './BaseEntity';
import { Location } from './Location';
import { Item } from './Item';

@Entity('inventory')
export class Inventory extends BaseEntity {
  @PrimaryGeneratedColumn({
    name: 'inventory_id',
  })
  id: number;

  @ManyToOne(() => Location, (location) => location.id)
  @JoinColumn({ name: 'location_id' })
  location: Location;

  @Column({ name: 'location_id' })
  locationId: number;

  @ManyToOne(() => Item, (item) => item.id)
  @JoinColumn({ name: 'item_sku' })
  item: Item;

  @Column({ name: 'item_sku' })
  itemSku: string;

  @Column()
  quantity: number;
}
