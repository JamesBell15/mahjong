# MAHJONG you can (not) play

This is a website for playing mahjong. HONG KONG MAHJONG. Take your riichi ass back to Japan.

## Setup

Node 24.0.0

Create a `.ssl` folder and run the following command inside.

`openssl req -nodes -new -x509 -keyout server.key -out server.cert`

## Dev

run `npm run dev`

## Testing

Uses `vitest` cuz jest smells.

run `npm run test`

## Production

Run with `docker compose up`
