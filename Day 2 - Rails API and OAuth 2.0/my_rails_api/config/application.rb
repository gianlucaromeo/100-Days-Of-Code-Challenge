require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyRailsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.api_only = true

    # Enable CORS, a security feature that prevents other 
    # websites from making requests to your API.
    # 
    # This puts the Rack::Cors middleware at the top 
    # of the middleware stack.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'  # Allow requests from any origin for now
    
        resource '*',  # Allow requests to any URL path for now
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
