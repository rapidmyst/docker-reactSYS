FROM node:alpine as rpd
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=rpd /app/build /usr
