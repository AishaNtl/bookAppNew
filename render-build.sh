#!/usr/bin/env bash
set -o errexit

# 1. Create SQLite storage
mkdir -p storage
touch storage/production.sqlite3

# 2. Install gems (skip dev/test)
bundle config set without 'development test'
bundle install

# 3. Run migrations
bundle exec rails db:migrate RAILS_ENV=production

# 4. Only precompile if assets exist
if [ -d app/assets ]; then
bundle exec rails assets:precompile RAILS_ENV=production
else
echo "No assets directory found, skipping precompilation"
fi