FROM node:20

ENV NODE_ENV development
WORKDIR /workspace/app/

COPY controllers controllers
COPY lib lib
COPY js js
COPY views views
COPY package.json .
COPY server.js .
COPY module module
COPY main.handlebars .

COPY .env .
RUN echo BUILDTIME=`date +%s` >> .env

RUN apt-get update
RUN apt-get install chromium -y

RUN npm i -g npm@latest
RUN npm install
ENTRYPOINT ["npm","start"]
