FROM node:19.2.0-alpine3.16

#Create app directory
WORKDIR /usr/src/app

#Copy package file 
COPY package.json .

#Install all dependencies from package file
RUN npm install

# Bundle app source
COPY . .

#Set arg with default port 3000
ARG DEFAULT_PORT=3000

#Create ENV PORT in image 
ENV PORT $DEFAULT_PORT

#Expose Application PORT
EXPOSE $PORT

#Start application
CMD ["npm","start"]

