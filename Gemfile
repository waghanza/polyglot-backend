source 'https://rubygems.org'

ruby '3.3.0'

gem 'active_interaction', '~> 5.3.0'
gem 'factory_bot_rails', '~> 6.4.3'
gem 'jsonapi-serializer', '~> 2.2.0'
gem 'pg', '~> 1.5.4'
gem 'puma', '~> 6.4.2'
gem 'rails', '~> 7.1.3'

gem 'bootsnap', require: false # is this really useful
group :development, :test do
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rufo'
end

group :development do
  gem 'overcommit'
end
group :test do
  gem 'database_cleaner-active_record', '~> 2.1.0'
end

gem "dockerfile-rails", ">= 1.6", :group => :development
