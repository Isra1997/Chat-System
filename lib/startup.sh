#!/bin/bash
set -e

echo "setting up db..."
rails db:setup

echo "running database migratios..."
rails db:migrate

if [ -f /app/tmp/pids/server.pid ]; then
    rm /app/tmp/pids/server.pid
fi 

echo "running the rails server..."
rails server -b 0.0.0.0 -p 3000