FROM node:18.20.4
WORKDIR /app
ADD . .
RUN npm install
CMD npm start


