import express from 'express';

const router = express.Router();

router.use('/health', require('./health'));
router.use('/company', require('./company'));
router.use('/user', require('./user'));
router.use('/item', require('./item'));
router.use('/location', require('./location'));
router.use('/inventory', require('./inventory'));

export = router;
