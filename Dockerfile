# Use NodeJS base image
FROM node:13

# Had to add this in order for docker image to pick up
# the environment variable from Travis build.
ARG NAME
ENV NAME=$NAME

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Bind the port that the image will run on
EXPOSE 8080

# Define the Docker image's behavior at runtime
CMD ["node", "server.js"]
