#!/usr/bin/env bash
set -o errexit

# 1. Create storage directory and database file
mkdir -p storage
touch storage/production.sqlite3

# 2. Install production gems only
bundle config set without 'development test'
bundle install

# 3. Run migrations
bundle exec rails db:migrate RAILS_ENV=production DATABASE_URL=sqlite3:storage/production.sqlite3

# 4. Precompile assets
bundle exec rails assets:precompile RAILS_ENV=production