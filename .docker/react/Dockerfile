FROM node:latest

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

VOLUME "/home/project"
WORKDIR "/home/project"

ENV PATH /app/node_modules/.bin:$PATH

RUN npm install -g create-react-app
