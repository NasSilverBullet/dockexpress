FROM node:10.12-alpine as build-stage

ENV NODE_ENV=development
ENV NODE_PATH=/usr/local/lib/node_modules

RUN mkdir /app

WORKDIR /app

RUN npm install express-generator -g \
  && npm install protobufjs -g

ENV ENTRYKIT_VERSION 0.4.0

RUN apk add openssl \
  && wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

ENTRYPOINT [ \
  "prehook", "node -v", "--", \
  "prehook", "npm -v", "--", \
  "prehook", "express --version", "--", \
  "prehook", "npm install", "--"]