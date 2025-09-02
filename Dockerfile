# Stage 1: Build
ARG NODE_VERSION=23.7.0

FROM node:${NODE_VERSION}-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Run
FROM node:${NODE_VERSION}-alpine
WORKDIR /app
COPY ./src/static ./build/static
COPY ./.ssl ./.ssl
COPY --from=builder /app/package*.json ./
RUN npm install --only=production
COPY --from=builder /app/build ./build
EXPOSE 3000
# CMD ls -a
CMD ["npm", "start"]
