#!/bin/sh

# Make sure docker is installed and is running
if ! command -v "docker" >/dev/null 2>&1 ; then
  echo "Docker is not installed !"
  exit 1
fi

echo "Configure database user"
read -r -p "Postgres user name: " name
echo "Postgres user password: " ; stty -echo ; read -r password; stty echo ; echo 

export POSTGRES_USER=$name
export POSTGRES_PASSWORD=$password
export DB_NAME="sample"

if docker ps -a | grep -q postgres ; then
    echo "Database already exists: we remote it" && docker rm --force postgres
fi

echo "Creating database container (and seed 'sample' database)"
docker run -d \
  --name postgres \
  -e POSTGRES_USER="$POSTGRES_USER" \
  -e POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  -e POSTGRES_DB=$DB_NAME \
  -p 5432:5432 \
  --restart always \
  postgres:11-alpine

sleep 2 # Ensure enough time for postgres database to initialize and create role

cat db/sample.sql | docker exec -i postgres psql -U "$POSTGRES_USER" -d "$DB_NAME"

# Check if table is correctly fit
docker exec -i postgres psql -U "$POSTGRES_USER" -d "$DB_NAME" -c "SELECT count(*) FROM employees"