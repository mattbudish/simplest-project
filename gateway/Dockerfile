FROM node:18-alpine

LABEL maintainer="Matt Budish <matt.budish@digikey.com>"

RUN npm install -g express-gateway

COPY gateway/ /opt/gateway

WORKDIR /opt/gateway

EXPOSE 8080

CMD ["npm", "start"]
