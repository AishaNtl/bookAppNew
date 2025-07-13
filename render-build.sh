#!/usr/bin/env bash
set -o errexit

# 1. Always recreate storage (ephemeral)
mkdir -p storage
touch storage/production.sqlite3

# 2. Install dependencies
bundle install --without development test

# 3. Seed fresh database
bundle exec rails db:migrate db:seed RAILS_ENV=production

# 4. Precompile assets
bundle exec rails assets:precompile RAILS_ENV=production