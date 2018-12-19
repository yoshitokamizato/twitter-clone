require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'

    config.generators do |g|
      g.javascripts false
      g.test_framework false
    end

    config.i18n.default_locale = :ja

    config.action_view.field_error_proc = Proc.new do |html_tag, html_error, instance| 
      html_tag
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
