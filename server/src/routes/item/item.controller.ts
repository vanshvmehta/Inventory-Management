import { Request, Response } from 'express';
import { Repository } from 'typeorm';
import { getPagination } from '../../utils/pagination';
import { validateAndFetchEntitySafe } from '../../utils/controllerHelpers';
import { Item } from '../../db/entity/Item';

export default class ItemController {
  public itemRepository: Repository<Item>;

  constructor(itemRepository: Repository<Item>) {
    this.itemRepository = itemRepository;
  }

  /**
   * Paginated list of items
   */
  async getItems(req: Request, res: Response) {
    const { page, itemsPerPage } = getPagination(req);

    const [items, total] = await this.itemRepository.findAndCount({
      skip: (page - 1) * itemsPerPage,
      take: itemsPerPage,
    });

    res.status(200).json({
      results: items,
      pagination: getPagination(req, total),
    });
  }

  async getItem(req: Request, res: Response) {
    const item = (await validateAndFetchEntitySafe(
      parseInt(req.params.itemId ?? ''),
      this.itemRepository,
      'Item',
      res,
    )) as Item;
    if (!item) return;

    res.status(200).json(item);
  }

  async createItem(req: Request, res: Response) {
    const { name, description, category, unitType, metadata } = req.body;

    if (!name || !description || !category || !unitType) {
      res.status(400).json({
        message: 'Name, description, category, and unit type are required',
      });
      return;
    }

    const item = new Item();
    item.name = name;
    item.description = description;
    item.category = category;
    item.unitType = unitType;
    item.metadata = metadata ?? {};
    item.createdAt = new Date();
    item.updatedAt = item.createdAt;

    await this.itemRepository.save(item);

    res.status(201).json(item);
  }

  async updateItem(req: Request, res: Response) {
    const { name, description, category, unitType, metadata } = req.body;

    if (!name || !description || !category || !unitType) {
      res.status(400).json({
        message: 'Name, description, category, and unit type are required',
      });
      return;
    }

    const item = (await validateAndFetchEntitySafe(
      parseInt(req.params.itemId ?? ''),
      this.itemRepository,
      'Item',
      res,
    )) as Item;
    if (!item) return;

    item.name = name;
    item.description = description;
    item.category = category;
    item.unitType = unitType;
    item.metadata = metadata ?? {};
    item.updatedAt = new Date();

    await this.itemRepository.save(item);

    res.status(200).json(item);
  }

  async deleteItem(req: Request, res: Response) {
    const item = (await validateAndFetchEntitySafe(
      parseInt(req.params.itemId ?? ''),
      this.itemRepository,
      'Item',
      res,
    )) as Item;
    if (!item) return;

    await this.itemRepository.remove(item);

    res.status(204).send();
  }
}
