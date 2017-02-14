source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "pg", "~> 0.18"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.1"
gem "sass-rails", "~> 5.0"
gem "simple_form", "~> 3.4"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
# auth and role
gem "devise", "~> 4.2"
gem "pundit", "~> 1.1"
# data processing
gem "datagrid", "~> 1.5", ">= 1.5.1"

# design
gem "bootstrap-datepicker-rails", "~> 1.6", ">= 1.6.4.1"
gem "bootstrap-kaminari-views", "~> 0.0.5"
gem "bootstrap-sass", "~> 3.3", ">= 3.3.7"
gem "font-awesome-sass", "~> 4.7.0"
gem "kaminari", "~> 1.0", ">= 1.0.1"
gem "momentjs-rails", ">= 2.9.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "faker"
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "guard-rails"
  gem "guard-rspec"
  gem "guard-rubocop"
  gem "listen", "~> 3.0.5"
  gem "rack-mini-profiler"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
