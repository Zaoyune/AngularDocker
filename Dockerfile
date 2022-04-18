# stage 1

FROM node:16 AS dash
WORKDIR /app
ADD package*.json ./
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=dash /app/dist/dashboard /usr/share/nginx/html
EXPOSE 80
