FROM node:20.7.0

RUN set -ex
RUN apt update
RUN apt upgrade -y  

VOLUME "/home/project"
WORKDIR "/home/project"

COPY startserver /etc/init.d/

RUN chmod +x /etc/init.d/startserver
RUN update-rc.d startserver defaults

ENV PATH /app/node_modules/.bin:$PATH

RUN npm install -g create-react-app@5.0.1 -g

CMD service startserver start && tail -F /var/log/react/error.log
