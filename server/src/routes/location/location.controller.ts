import { Request, Response } from 'express';
import { Repository } from 'typeorm';
import { getPagination } from '../../utils/pagination';
import { validateAndFetchEntitySafe } from '../../utils/controllerHelpers';
import { Location } from '../../db/entity/Location';

export default class LocationController {
  public locationRepository: Repository<Location>;

  constructor(locationRepository: Repository<Location>) {
    this.locationRepository = locationRepository;
  }

  async getLocations(req: Request, res: Response) {
    const { page, itemsPerPage } = getPagination(req);

    const [locations, total] = await this.locationRepository.findAndCount({
      skip: (page - 1) * itemsPerPage,
      take: itemsPerPage,
    });

    res.status(200).json({
      results: locations,
      pagination: getPagination(req, total),
    });
  }

  async getLocation(req: Request, res: Response) {
    const location = (await validateAndFetchEntitySafe(
      parseInt(req.params.locationId ?? ''),
      this.locationRepository,
      'Location',
      res,
    )) as Location;
    if (!location) return;

    res.status(200).json(location);
  }

  async createLocation(req: Request, res: Response) {
    const { companyId, name, addr } = req.body;

    if (!companyId || !name || !addr) {
      res.status(400).json({
        message: 'Company ID, name, and address are required',
      });
      return;
    }

    const locationEntity = new Location();
    locationEntity.companyId = companyId;
    locationEntity.name = name;
    locationEntity.addr = addr;
    locationEntity.createdAt = new Date();
    locationEntity.updatedAt = locationEntity.createdAt;

    await this.locationRepository.save(locationEntity);

    res.status(201).json(locationEntity);
  }

  async updateLocation(req: Request, res: Response) {
    const { companyId, name, addr } = req.body;

    if (!companyId || !name || !addr) {
      res.status(400).json({
        message: 'Company ID, name, and address are required',
      });
      return;
    }

    const locationEntity = (await validateAndFetchEntitySafe(
      parseInt(req.params.locationId ?? ''),
      this.locationRepository,
      'Location',
      res,
    )) as Location;
    if (!locationEntity) return;

    locationEntity.companyId = companyId;
    locationEntity.name = name;
    locationEntity.addr = addr;
    locationEntity.updatedAt = new Date();

    await this.locationRepository.save(locationEntity);

    res.status(200).json(locationEntity);
  }

  async deleteLocation(req: Request, res: Response) {
    const location = (await validateAndFetchEntitySafe(
      parseInt(req.params.locationId ?? ''),
      this.locationRepository,
      'Location',
      res,
    )) as Location;
    if (!location) return;

    await this.locationRepository.remove(location);

    res.status(204).json();
  }
}
