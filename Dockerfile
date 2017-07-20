FROM node:8.1.4-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./index.js ./index.html ./package.json /usr/src/app/
RUN npm install
EXPOSE 80
CMD node /usr/src/app/index.js
