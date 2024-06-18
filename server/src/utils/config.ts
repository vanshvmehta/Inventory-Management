import dotenv from 'dotenv';

/** Env Loader */
dotenv.config({ path: `.env.${process.env.NODE_ENV}` });

const config = {
  NODE_ENV: process.env.NODE_ENV || 'development',
  server: {
    HOST: process.env.HOST || 'localhost',
    PORT: process.env.PORT || 3000,
  },
};

export default config;
