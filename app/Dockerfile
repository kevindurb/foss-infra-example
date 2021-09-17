FROM docker.io/node:12
USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY ./package.json ./
COPY ./package-lock.json ./

RUN npm install

COPY ./index.js ./

CMD ["node", "index.js"]
