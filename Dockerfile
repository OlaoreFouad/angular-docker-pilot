FROM node:15.4 as build

WORKDIR /app
COPY package*.json .
RUN npm install
RUN npm run prod

FROM nginx:1.9

COPY ./nginx-custom.conf /etc/nginx/nginx.conf
COPY ./dist/angular-docker-pilot/ /usr/share/nginx/html
