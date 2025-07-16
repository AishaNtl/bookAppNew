#!/usr/bin/env bash
set -o errexit

# Create SQLite storage
mkdir -p storage
touch storage/production.sqlite3
touch storage/production_queue.sqlite3

# Install gems
bundle config set without 'development test'
bundle install
bundle exec rails db:migrate

# Run migrations
bundle exec rails db:migrate RAILS_ENV=production

# Skip assets for API-only app
echo "Skipping asset precompilation for API-only app"
