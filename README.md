docker-sapo-broker
==================
SAPO's Broker inside dotcloud's Docker.

For now this is just a Dockerfile to start a SAPO Broker server.

Requirements
------------
You must have docker.io installed. 

Installation 
------------
Create the image

    mv Dockefile.server Dockerfile
    sudo docker build -rm -t="you/name-it" .

Start a new container from the image previously created.

    sudo docker run -d -t you/name-it

Notes
-----
If you want to go inside the container you've just created you 
must run a command inside it, meaning you must run `/bin/bash`

    sudo docker run -i -t jpn/sapo-broker-server /bin/bash

Utilities
---------

    sudo docker -h
    sudo docker ps -a -s
    sudo docker inspect <ID>
    sudo docker logs <ID>
