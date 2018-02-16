source "https://rubygems.org"

ruby "2.3.3"

# Use Puma as the app server
gem "puma", "~> 3.7"
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.5"
# Use sqlite3 as the database for Active Record
gem "sqlite3"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "geocoder"
  gem "rspec-rails", "~> 3.5"
  gem "rubocop"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "database_cleaner"
  gem "factory_girl_rails", "~> 4.0"
  gem "faker"
  gem "shoulda-matchers", "~> 3.1"
end
