# Load the Rails application.
require File.expand_path('../application', __FILE__)



# Initialize the Rails application.
Rails.application.initialize!

module Empaquesrecoleta
  class Application < Rails::Application
    config.i18n.default_locale = :es
  end
end
