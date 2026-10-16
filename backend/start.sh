#!/bin/sh
set -e

mkdir -p writable/cache writable/logs writable/session writable/uploads writable/debugbar
mkdir -p public/images/payments public/images/refunds public/images/profiles
chmod -R 777 writable public/images 2>/dev/null || true

echo "Running database migrations..."
php spark migrate --all || true

echo "Seeding initial COCOIR data (idempotent)..."
php spark db:seed DatabaseSeeder || true

PORT="${PORT:-8080}"
echo "Starting COCOIR web server on 0.0.0.0:${PORT}..."
exec php -S "0.0.0.0:${PORT}" -t public public/router.php
