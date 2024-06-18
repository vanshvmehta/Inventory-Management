FROM node:20.14-alpine3.19

WORKDIR /bin/www

COPY package*.json ./

RUN npm install -g typescript

RUN npm install

RUN npm run build

COPY .env* ./build

WORKDIR /bin/www/build

EXPOSE 3000

CMD node server.js
