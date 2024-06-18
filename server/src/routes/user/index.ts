import express from 'express';
import { db } from '../../db/data-source';
import { User } from '../../db/entity/User';
import { Company } from '../../db/entity/Company';
import UserController from './user.controller';
import logger from '../../utils/logger';

const router = express.Router();

const userRepository = db.getRepository(User);
const companyRepository = db.getRepository(Company);
const userController = new UserController(userRepository, companyRepository);

// If they route to /, return a 404
router.get('/', (_, res) => {
  logger.error('No user ID provided');
  res.status(404).json({
    message: 'User ID must be an integer',
  });
});

router.get('/:userId', userController.getUser.bind(userController));
router.post('/', userController.createUser.bind(userController));
router.post(
  '/:userId/reset-password',
  userController.resetPassword.bind(userController),
);
router.patch('/:userId', userController.updateUser.bind(userController));
router.delete('/:userId', userController.deleteUser.bind(userController));

export = router;
