FROM node:18-alpine AS builder
WORKDIR /app
COPY /package.json ./
COPY /yarn.lock ./
RUN yarn

COPY . .
RUN yarn build


FROM alpine
WORKDIR /build

COPY --from=builder /app/dist .
