# Stage 1
FROM node:14.20 as build-stage
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

# Stage 2
FROM nginx:alpine
COPY --from=build-stage /app/dist/marketing-website /usr/share/nginx/html