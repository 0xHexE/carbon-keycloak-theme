FROM node:10 as node

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build:prod

FROM busybox
COPY --from=node /usr/src/app/carbon /carbon
