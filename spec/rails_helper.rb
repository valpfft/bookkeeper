ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"
require "shoulda/matchers"
require "database_cleaner"
require "pundit/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework :rspec
#     with.library :rails
#   end
# end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Features, type: :feature
  config.include Features::SessionHelpers, type: :feature
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include Warden::Test::Helpers
  config.before :suite do
    Warden.test_mode!
  end
end
