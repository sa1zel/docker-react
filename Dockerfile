
#Create builder container for app
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run server from builded app
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


