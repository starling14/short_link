require_relative 'boot'

require 'rails/all'

require_relative '../app/middleware/user_url_redirect'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ShortLink
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths << Rails.root.join('lib')

    config.middleware.insert_before ActionDispatch::Static, UserUrlRedirect
  end
end
