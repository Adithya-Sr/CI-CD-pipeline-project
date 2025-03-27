#!/bin/bash
set -e 
cd /home/ubuntu 

docker-compose down
 
docker-compose pull
 
docker-compose up -d
