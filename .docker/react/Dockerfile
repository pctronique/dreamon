FROM node:latest

RUN apt-get update &&\ 
    apt-get install -y --no-install-recommends apt-utils

VOLUME "/home/project"
WORKDIR "/home/project"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

ENV PATH /app/node_modules/.bin:$PATH

RUN npm install -g create-react-app

CMD service startserver start && tail -F /var/log/react/error.log
