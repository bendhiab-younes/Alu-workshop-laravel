#!/bin/bash

# Create storage directories if they don't exist
mkdir -p storage/framework/{sessions,views,cache}
mkdir -p storage/logs
mkdir -p bootstrap/cache

# Set permissions
chmod -R 775 storage bootstrap/cache

# Create SQLite database if it doesn't exist
touch database/database.sqlite

# Run migrations and seeders
php artisan migrate --force
php artisan db:seed --force

# Optimize for production
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Deployment setup complete!"
