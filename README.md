# Web App Fullstack using Docker + Node.js + MongoDB

Dockerfile for automatically stand up a data driven website (Node.js + MongoDB) from scratch ready to deploy a web app
The Dockerfile build a docker image (running ubuntu/trusty) which provide a simple web app written in node.js. The node.js app use mongodb as a data store.

### Procedure:
* build the image

`docker build -t buglione/docker-fullstack-webapp`

* run the docker container exposing the port 8080

`docker run -d -p 8080:8080 buglione/docker-fullstack-webapp`

* then point your web browser to localhost:8080 or use the curl command in order to reach the app

`curl http://localhost:8080`


