source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.1'

gem 'pg'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'

group :development do
  gem 'spring'
  gem 'better_errors'
end

group :test, :development do
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'spring-commands-rspec'
  gem 'pry', '~> 0.10'
  gem 'pry-remote'
  gem 'pry-rails'
  gem 'rails_best_practices'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
end

group :test do
  gem 'database_cleaner'
end
