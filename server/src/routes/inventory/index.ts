import express from 'express';
import { db } from '../../db/data-source';
import { Inventory } from '../../db/entity/Inventory';
import InventoryController from './inventory.controller';

const router = express.Router();

const inventoryRepository = db.getRepository(Inventory);
const inventoryController = new InventoryController(inventoryRepository);

router.get('/', inventoryController.getInventories.bind(inventoryController));
router.get(
  '/:inventoryId',
  inventoryController.getInventory.bind(inventoryController),
);
router.post('/', inventoryController.createInventory.bind(inventoryController));
router.patch(
  '/:inventoryId',
  inventoryController.updateInventory.bind(inventoryController),
);
router.delete(
  '/:inventoryId',
  inventoryController.deleteInventory.bind(inventoryController),
);

export = router;
