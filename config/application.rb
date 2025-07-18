# require_relative "boot"

# require "rails/all"

# # Require the gems listed in Gemfile, including any gems
# # you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

# module BookApp
#   class Application < Rails::Application
#     # Initialize configuration defaults for originally generated Rails version.
#     config.load_defaults 8.0
#     # config.assets.enabled = true
#     # config.assets.version = "1.0"

#     # Please, add to the `ignore` list any other `lib` subdirectories that do
#     # not contain `.rb` files, or that should not be reloaded or eager loaded.
#     # Common ones are `templates`, `generators`, or `middleware`, for example.
#     config.autoload_lib(ignore: %w[assets tasks])

#     # Configuration for the application, engines, and railties goes here.
#     #
#     # These settings can be overridden in specific environments using the files
#     # in config/environments, which are processed later.
#     #
#     # config.time_zone = "Central Time (US & Canada)"
#     # config.eager_load_paths << Rails.root.join("extras")

#     # Only loads a smaller set of middleware suitable for API only apps.
#     # Middleware like session, flash, cookies can be added back manually.
#     # Skip views, helpers and assets when generating a new resource.
#     config.api_only = true

#     # Configure generators
#     config.generators do |g|
#       g.test_framework :test_unit, fixture: false
#       # Add other generator configurations if needed
#       g.helper false         # Don't create helper files
#       g.assets false         # Don't create asset files
#       g.view_specs false     # Don't create view specs
#     end
#   end
# end
require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module BookApp
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    config.api_only = true

    # Add this CORS configuration (place it before the generators config)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins "*" # For development
        resource "*",
          headers: :any,
          methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
          credentials: false # Set to true if using cookies/auth
      end
    end

    # Configure generators
    config.generators do |g|
      g.test_framework :test_unit, fixture: false
      g.helper false
      g.assets false
      g.view_specs false
    end
  end
end
