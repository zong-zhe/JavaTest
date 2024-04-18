#!/bin/bash

# Start Nexus OSS
docker run -d -p 8082:8081 --name nexus sonatype/nexus3

# Configure Nexus Repository
echo "Waiting for Nexus to start..."
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' http://localhost:8082)" != "200" ]]; do sleep 5; done
curl -u admin:admin123 --header "Content-Type: application/json" 'http://localhost:8082/service/rest/v1/security/users' -d'
{
  "userId": "test",
  "firstName": "test",
  "lastName": "test",
  "emailAddress": "test@example.com",
  "password": "1234",
  "status": "active",
  "roles": ["nx-admin"]
}'
