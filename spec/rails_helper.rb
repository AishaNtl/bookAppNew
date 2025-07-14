# bookApp/spec/rails_helper.rb
# run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'factory_bot_rails'
require 'capybara/rspec'
require 'selenium-webdriver'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  include FactoryBot::Syntax::Methods

  # Capybara system test configuration
  config.before(:each, type: :system) do
    # Use :rack_test driver by default (no browser)
    driven_by :rack_test

    # For JavaScript tests, configure Chrome
    if ENV['SELENIUM_DRIVER'] == 'chrome'
      driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ], options: {
        'goog:chromeOptions' => {
          'args' => %w[no-sandbox disable-dev-shm-usage disable-gpu]
        }
      }
    end
  end

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
