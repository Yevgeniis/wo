FROM node:19.2.0-alpine3.16

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

CMD ["node","nodeapp.js"]

