#!/bin/bash
set -e

echo "running database migratios..."
rails db:migrate

echo "running the rails server..."
rails server -b 0.0.0.0 -p 3000
