FROM node:18 AS build

WORKDIR /app

COPY package.json yarn.lock /app/
RUN cd /app \
    && yarn install --pure-lockfile

COPY . .
RUN yarn build

FROM steebchen/nginx-spa:stable
COPY --from=build /app/build /app
