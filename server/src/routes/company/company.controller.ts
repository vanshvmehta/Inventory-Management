import { Request, Response } from 'express';
import { Repository } from 'typeorm';
import { Company } from '../../db/entity/Company';
import { getPagination } from '../../utils/pagination';
import { validateAndFetchEntitySafe } from '../../utils/controllerHelpers';

export default class CompanyController {
  public companyRepository: Repository<Company>;

  constructor(companyRepository: Repository<Company>) {
    this.companyRepository = companyRepository;
  }

  /**
   * Paginated list of companies
   */
  async getCompanies(req: Request, res: Response) {
    const { page, itemsPerPage } = getPagination(req);

    const [companies, total] = await this.companyRepository.findAndCount({
      skip: (page - 1) * itemsPerPage,
      take: itemsPerPage,
    });

    res.status(200).json({
      results: companies,
      pagination: getPagination(req, total),
    });
  }

  async getCompany(req: Request, res: Response) {
    const company = (await validateAndFetchEntitySafe(
      parseInt(req.params.companyId ?? ''),
      this.companyRepository,
      'Company',
      res,
    )) as Company;
    if (!company) return;

    res.status(200).json(company);
  }

  async createCompany(req: Request, res: Response) {
    const { name, addr } = req.body;

    if (!name || !addr) {
      res.status(400).json({
        message: 'Name and address are required',
      });
      return;
    }

    const company = new Company();
    company.name = name;
    company.addr = addr;
    company.createdAt = new Date();
    company.updatedAt = company.createdAt;

    await this.companyRepository.save(company);

    res.status(201).json(company);
  }

  async updateCompany(req: Request, res: Response) {
    const { name, addr } = req.body;

    if (!name || !addr) {
      res.status(400).json({
        message: 'Name and address are required',
      });
      return;
    }

    const company = (await validateAndFetchEntitySafe(
      parseInt(req.params.companyId ?? ''),
      this.companyRepository,
      'Company',
      res,
    )) as Company;
    if (!company) return;

    company.name = name;
    company.addr = addr;
    company.updatedAt = new Date();

    await this.companyRepository.save(company);

    res.status(200).json(company);
  }

  async deleteCompany(req: Request, res: Response) {
    const company = (await validateAndFetchEntitySafe(
      parseInt(req.params.companyId ?? ''),
      this.companyRepository,
      'Company',
      res,
    )) as Company;
    if (!company) return;

    await this.companyRepository.remove(company);

    res.status(204).send();
  }
}
