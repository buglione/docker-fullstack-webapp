FROM ubuntu:14.04
MAINTAINER Mariano Buglione <buglione@gmail.com>

# update repo
RUN apt-get update

# install prereqs for mongodb, mongodb, nodejs and npm 
RUN apt-get install -y gcc make build-essential 
RUN apt-get install -y curl
RUN apt-get install -y python
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y nodejs
RUN apt-get install -y mongodb git git-core  

# add the prereqs and the app 
ADD package.json /tmp/
ADD app.js /tmp/
RUN cd /tmp && npm update -g && npm install 

# start the mongodb, add default data to the mongodb and start the app
ADD start.sh /tmp/
RUN chmod +x /tmp/start.sh
EXPOSE 8080
CMD ["/tmp/start.sh"]

