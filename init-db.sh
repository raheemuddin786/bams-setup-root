#!/bin/bash
set -e

# Wait for mysql to be ready
until mysql -u root -p"1" -e "SELECT 1;" &> /dev/null; do
  echo "MySQL is not ready yet"
  sleep 2
done

echo "MySQL is ready. Importing data..."

# Import the database schema and data
mysql -u root -p"1" alm_tool < /docker-entrypoint-initdb.d/alm_tool.sql

echo "Database initialization completed."
