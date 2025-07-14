# spec/rails_helper.rb
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
  end

  config.before(:each, type: :system, js: true) do
    # For JavaScript tests, configure headless Chrome
    chrome_options = Selenium::WebDriver::Chrome::Options.new
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--disable-dev-shm-usage')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('--headless')

    driven_by :selenium, using: :chrome, screen_size: [ 1400, 1400 ], options: { options: chrome_options }
  end

  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
