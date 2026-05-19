FROM node:22 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


FROM caddy:alpine
COPY --from=builder /app/dist /usr/share/caddy
EXPOSE 80