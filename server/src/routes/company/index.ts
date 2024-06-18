import express from 'express';
import { db } from '../../db/data-source';
import { Company } from '../../db/entity/Company';
import CompanyController from './company.controller';

const router = express.Router();

const companyRepository = db.getRepository(Company);
const companyController = new CompanyController(companyRepository);

router.get('/', companyController.getCompanies.bind(companyController));
router.get('/:companyId', companyController.getCompany.bind(companyController));
router.post('/', companyController.createCompany.bind(companyController));
router.patch(
  '/:companyId',
  companyController.updateCompany.bind(companyController),
);
router.delete(
  '/:companyId',
  companyController.deleteCompany.bind(companyController),
);

export = router;
