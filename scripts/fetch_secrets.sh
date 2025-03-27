#!/bin/bash
echo "Fetching secrets from AWS Parameter Store..."

export DATABASE_USERNAME=$(aws ssm get-parameter --name "/cicdProject/database/username" --with-decryption --query "Parameter.Value" --output text)
export DATABASE_PASSWORD=$(aws ssm get-parameter --name "/cicdProject/database/password" --with-decryption --query "Parameter.Value" --output text)
export DOCKER_REGISTRY_URL=$(aws ssm get-parameter --name "/appname/docker-registry/url" --with-decryption --query "Parameter.Value" --output text)
export DOCKER_REGISTRY_USERNAME=$(aws ssm get-parameter --name "/appname/docker-credentials/username" --with-decryption --query "Parameter.Value" --output text)

echo "Secrets fetched and exported."
