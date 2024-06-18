import express from 'express';
import { db } from '../../db/data-source';
import { Location } from '../../db/entity/Location';
import LocationController from './location.controller';

const router = express.Router();

const locationRepository = db.getRepository(Location);
const locationController = new LocationController(locationRepository);

router.get('/', locationController.getLocations.bind(locationController));
router.get(
  '/:locationId',
  locationController.getLocation.bind(locationController),
);
router.post('/', locationController.createLocation.bind(locationController));
router.patch(
  '/:locationId',
  locationController.updateLocation.bind(locationController),
);
router.delete(
  '/:locationId',
  locationController.deleteLocation.bind(locationController),
);

export = router;
