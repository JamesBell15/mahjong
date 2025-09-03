# syntax=docker/dockerfile:1

ARG NODE_VERSION=23.7.0

FROM node:${NODE_VERSION}-alpine AS base
WORKDIR /app

FROM base AS builder
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Run
FROM base AS deploy
COPY ./src/static ./build/static
COPY ./.ssl ./.ssl
COPY --from=builder /app/package*.json ./
RUN npm install --only=production
COPY --from=builder /app/build ./build
EXPOSE 3000
CMD ["npm", "start"]
