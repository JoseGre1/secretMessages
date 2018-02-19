source "https://rubygems.org"

ruby "2.3.3"

gem "draper"
gem "geocoder", "1.4.1"
gem "pg"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.5"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec-rails", "~> 3.5"
  gem "rubocop"
  gem "swagger-docs"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers", "~> 3.1"
  gem "simplecov", require: false
end
