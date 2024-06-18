import { Repository } from 'typeorm';
import { DBEntity } from '../db/entity/DBEntity';
import { Response } from 'express';

const validateAndFetchEntity = async (
  entityId: number | null,
  repository: Repository<DBEntity>,
  entityType: string,
) => {
  if (!entityId) {
    throw new TypeError(`${entityType} ID must be an integer`);
  }

  return await repository.findOne({
    where: { id: entityId },
  });
};

export const validateAndFetchEntitySafe = async (
  entityId: number | null,
  repository: Repository<DBEntity>,
  entityType: string,
  res: Response,
) => {
  try {
    const entity = await validateAndFetchEntity(
      entityId,
      repository,
      entityType,
    );

    if (!entity) {
      res.status(404).json({
        message: `${entityType} not found`,
      });
    }

    return entity;
  } catch (error: any) {
    res.status(400).json({
      message: error.message,
    });
    return null;
  }
};
