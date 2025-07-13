# ENV["RAILS_ENV"] ||= "test"
# require_relative "../config/environment"
# require "rails/test_help"

# module ActiveSupport
#   class TestCase
#     # Run tests in parallel with specified workers
#     parallelize(workers: :number_of_processors, with: :threads)

#     # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#     fixtures :all

#     # Add more helper methods to be used by all tests here...
#   end
# end
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "factory_bot_rails"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # Remove this line if you're not using fixtures
    # fixtures :all

    # Include FactoryBot methods
    include FactoryBot::Syntax::Methods

    # Add more helper methods to be used by all tests here...
  end
end
