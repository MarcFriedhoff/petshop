FROM node:9-slim
WORKDIR /app
COPY . /app
RUN npm install
RUN npm uninstall react-router-dom
RUN npm install react-router-dom@5.2.0 --save
EXPOSE 3000
CMD ["npm", "start"]