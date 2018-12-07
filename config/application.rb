require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecipeApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    #config.action_controller.include_all_helpers = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

#     ActionMailer::Base.smtp_settings = {
#     :address => 'smtp.mandrillapp.com',
#     :port => '587',
#     :user_name => "Student",
#     :password => "KuzYSZFDRMQ42JAnY8LaVw",
#     :authentication => :plain,
#     :enable_starttls_auto => true 
# }
   ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :domain => 'mail.google.com',
    :port => 587,
    :user_name => "shaikshabeena115@gmail.com",
    :password => "sonydell",
    :authentication => 'login',
    :enable_starttls_auto => true 
}
  end
end
