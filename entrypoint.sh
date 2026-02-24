#!/bin/bash
set -e # עוצר את הסקריפט אם אחת הפקודות נכשלת

echo "Running Database Migrations..."
python statuspage/manage.py migrate --no-input

echo "Collecting Static Files..."
python statuspage/manage.py collectstatic --no-input

echo "Starting Gunicorn Server..."
# הפקודה הזו מריצה את מה שהוגדר כ-CMD ב-Dockerfile (הפעלת השרת)
exec "$@"
