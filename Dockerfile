
FROM node:latest as build
WORKDIR /usr/local/app
COPY ./ /usr/local/app/
RUN npm install
RUN npm run build

FROM nginx:latest

FROM nginxinc/nginx-unprivileged 
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/local/app/dist/docker-ui /usr/share/nginx/html
EXPOSE 8080