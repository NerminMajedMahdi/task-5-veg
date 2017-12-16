require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

config.cache_store = :redis_store, "redis://localhost:6379/0/cache"
config.assets.paths << Rails.root.join("vendor","assets", "javascripts")


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module MYApp
  class Application < Rails::Application
   # config.assets.paths << Rails.root.join('node_modules')
config.assets.initialize_on_precompile = false
config.assets.precompile = []


 end
end






