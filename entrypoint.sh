#!/bin/bash
set -e

echo "Running Database Migrations..."
python statuspage/manage.py migrate --no-input

echo "Collecting Static Files..."
python statuspage/manage.py collectstatic --no-input

echo "Starting Gunicorn Server...."

exec "$@"
