require_relative 'boot'

require "rails"

# Include each railties manually, excluding `active_storage/engine`
%w(
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Snb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.serve_static_assets = true
    config.assets.compile = true
    config.assets.paths << "/home/rishabh/websites/snbenterprises-website/public/images/enterprises/products/"
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
