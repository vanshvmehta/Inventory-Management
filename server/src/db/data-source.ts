import { DataSource } from 'typeorm';

export const db = new DataSource({
  type: 'postgres',
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT || '5432'),
  username: process.env.DB_USER || 'test',
  password: process.env.DB_PASSWORD || 'test',
  database: process.env.DB_NAME || 'test',
  synchronize: false,
  logging: true,
  entities: [`${__dirname}/entity/*.{ts,js}`],
});
