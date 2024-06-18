import { Request, Response } from 'express';
import { Repository } from 'typeorm';
import { getPagination } from '../../utils/pagination';
import { validateAndFetchEntitySafe } from '../../utils/controllerHelpers';
import { Location } from '../../db/entity/Location';
import { Inventory } from '../../db/entity/Inventory';

export default class InventoryController {
  public inventoryRepository: Repository<Inventory>;

  constructor(inventoryRepository: Repository<Inventory>) {
    this.inventoryRepository = inventoryRepository;
  }

  async getInventories(req: Request, res: Response) {
    const { page, itemsPerPage } = getPagination(req);

    const [inventories, total] = await this.inventoryRepository.findAndCount({
      skip: (page - 1) * itemsPerPage,
      take: itemsPerPage,
    });

    res.status(200).json({
      results: inventories,
      pagination: getPagination(req, total),
    });
  }

  async getInventory(req: Request, res: Response) {
    const inventory = (await validateAndFetchEntitySafe(
      parseInt(req.params.inventoryId ?? ''),
      this.inventoryRepository,
      'Inventory',
      res,
    )) as Inventory;
    if (!inventory) return;

    res.status(200).json(inventory);
  }

  async createInventory(req: Request, res: Response) {
    const { locationId, itemSku, quantity } = req.body;

    if (!locationId || !itemSku || !quantity) {
      res.status(400).json({
        message: 'Location ID, item SKU, and quantity are required',
      });
      return;
    }

    const inventory = new Inventory();
    inventory.locationId = locationId;
    inventory.itemSku = itemSku;
    inventory.quantity = quantity;
    inventory.createdAt = new Date();
    inventory.updatedAt = inventory.createdAt;

    await this.inventoryRepository.save(inventory);

    res.status(201).json(inventory);
  }

  async updateInventory(req: Request, res: Response) {
    const { locationId, itemSku, quantity } = req.body;
    const inventory = (await validateAndFetchEntitySafe(
      parseInt(req.params.inventoryId ?? ''),
      this.inventoryRepository,
      'Inventory',
      res,
    )) as Inventory;
    if (!inventory) return;

    inventory.locationId = locationId;
    inventory.itemSku = itemSku;
    inventory.quantity = quantity;
    inventory.updatedAt = new Date();

    await this.inventoryRepository.save(inventory);

    res.status(200).json(inventory);
  }

  async deleteInventory(req: Request, res: Response) {
    const inventory = (await validateAndFetchEntitySafe(
      parseInt(req.params.inventoryId ?? ''),
      this.inventoryRepository,
      'Inventory',
      res,
    )) as Inventory;
    if (!inventory) return;

    await this.inventoryRepository.remove(inventory);

    res.status(204).json();
  }
}
