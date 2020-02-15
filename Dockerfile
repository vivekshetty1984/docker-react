FROM node:alpine as builder
WORKDIR /app
COPY ./package*.json ./
#RUN npm config set strict-ssl false
#RUN npm config set unsafe-perm true
#RUN npm config set registry http://registry.npmjs.org/
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
