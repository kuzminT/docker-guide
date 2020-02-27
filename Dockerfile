FROM node:alpine as builder
WORKDIR /app
#Install some dependencies
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Default command
#CMD ["npm", "run", "start"]
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
