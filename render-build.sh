#!/usr/bin/env bash
set -o errexit

# Create SQLite storage
mkdir -p storage
chmod -R 777 storage
touch storage/production.sqlite3

# Install gems
bundle config set without 'development test'
bundle install

# Run migrations
bundle exec rails db:migrate RAILS_ENV=production

# Skip assets for API-only app
echo "Skipping asset precompilation for API-only app"
