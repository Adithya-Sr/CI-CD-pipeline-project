#!/bin/bash
cd /home/ubuntu

echo "Loading environment variables..."
source fetch_secrets.sh   

echo "Logging into Docker..."
echo "$DOCKER_REGISTRY_PASSWORD" | docker login -u "$DOCKER_REGISTRY_USERNAME" --password-stdin $DOCKER_REGISTRY_URL

echo "Starting containers..."
docker-compose down
docker compose pull
docker compose up -d


