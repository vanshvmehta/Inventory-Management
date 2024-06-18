import http from 'http';
import express from 'express';
import morgan from './middleware/morgan';
import logger from './utils/logger';
import config from './utils/config';
import { db } from './db/data-source';
import 'reflect-metadata';

/** Connect to db */
db.initialize()
  .then(() => {
    logger.info('Database connected');
  })
  .catch((error: Error) => {
    logger.error('Database connection failed', error);
  });

const app = express();

/** Server Handling */
const httpServer = http.createServer(app);

/** Log the request */
app.use(morgan);

/** Parse the body of the request */
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

/** Rules of our API */
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept, Authorization',
  );

  if (req.method == 'OPTIONS') {
    res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET');
    return res.status(200).json({});
  }

  next();
});

/** Routes */
app.use('/', require('./routes'));

/** Error handling */
app.use((req, res) => {
  const error = new Error('Not found');

  res.status(404).json({
    message: error.message,
  });
});

/** Listen */
httpServer.listen(config.server.PORT, () => {
  logger.info(`Environment: ${process.env.NODE_ENV}`);
  logger.info(`Server is running ${config.server.HOST}:${config.server.PORT}`);
});
