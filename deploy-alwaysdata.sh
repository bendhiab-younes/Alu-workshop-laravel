#!/bin/bash
# AlwaysData Deployment Script
# Run this after uploading files via FTP and connecting via SSH

set -e

echo "🚀 Promo Alu Plus - AlwaysData Deployment"
echo "=========================================="

# 1. Install composer dependencies
echo "📦 Installing dependencies..."
composer install --optimize-autoloader --no-dev

# 2. Generate app key
echo "🔑 Generating application key..."
php artisan key:generate

# 3. Run migrations
echo "🗄️ Running database migrations..."
php artisan migrate --force

# 4. Seed database
echo "🌱 Seeding database..."
php artisan db:seed --force

# 5. Cache config
echo "⚡ Caching configuration..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# 6. Fix permissions
echo "🔒 Setting permissions..."
chmod -R 775 storage
chmod -R 775 bootstrap/cache

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📍 Your site is live:"
echo "   Public: https://your-domain.alwaysdata.net"
echo "   Admin:  https://your-domain.alwaysdata.net/admin"
echo ""
echo "👤 Admin credentials:"
echo "   Email: admin@aluminiumcraft.tn"
echo "   Password: password (CHANGE THIS!)"
echo ""
