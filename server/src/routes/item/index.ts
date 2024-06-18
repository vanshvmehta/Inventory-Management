import express from 'express';
import { db } from '../../db/data-source';
import { Item } from '../../db/entity/Item';
import ItemController from './item.controller';

const router = express.Router();

const itemRepository = db.getRepository(Item);
const itemController = new ItemController(itemRepository);

router.get('/', itemController.getItems.bind(itemController));
router.get('/:itemId', itemController.getItem.bind(itemController));
router.post('/', itemController.createItem.bind(itemController));
router.patch('/:itemId', itemController.updateItem.bind(itemController));
router.delete('/:itemId', itemController.deleteItem.bind(itemController));

export = router;
