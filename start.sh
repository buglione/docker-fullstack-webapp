#!/bin/bash

# define smallfiles in /etc/mongodb.conf (useful for small systems)
echo "smallfiles = true" >> /etc/mongodb.conf

# start mongodb
/etc/init.d/mongodb start
# it take some time to be fully operative
sleep 15

# add data to database in order to be accessible from our webapp
mongo database --eval "db.users.save({\"name\": \"mariano\", \"last_name\":\"buglione\", \"email\":\"buglione@gmail.com\" })"
mongo database --eval "db.users.save({\"name\": \"leon\", \"last_name\":\"buglione\", \"email\":\"leon.buglione@gmail.com\" })"
mongo database --eval "db.users.save({\"name\": \"ciro\", \"last_name\":\"buglione\", \"email\":\"ciro.buglione@gmail.com\" })"

echo "* Starting webapp..."
node /tmp/app.js 

