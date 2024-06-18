import express from 'express';
import { db } from '../../db/data-source';
import { Test } from '../../db/entity/Test';

const router = express.Router();

/*
 * GET /health
 * Returns the service status
 */
router.get('/', (req, res) => {
  res.status(200).json({
    message: 'OK',
  });
});

router.get('/test', async (req, res) => {
  const testRespository = db.getRepository(Test);
  const allTests = await testRespository.find();

  res.status(200).json(allTests);
});

export = router;
