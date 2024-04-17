#!/bin/bash

# Create a network
docker network create mynetwork

# Start Nexus OSS in the created network
docker run -d -p 8081:8081 --network=mynetwork --name nexus sonatype/nexus3

# Configure Nexus Repository
echo "Waiting for Nexus to start..."
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://nexus:8081)" != "200" ]]; do sleep 5; done
curl -u admin:admin123 --header "Content-Type: application/json" 'http://nexus:8081/service/rest/v1/security/users' -d'
{
  "userId": "test",
  "firstName": "test",
  "lastName": "test",
  "emailAddress": "test@example.com",
  "password": "1234",
  "status": "active",
  "roles": ["nx-admin"]
}'
