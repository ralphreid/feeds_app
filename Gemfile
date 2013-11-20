ruby '2.0.0'
source 'https://rubygems.org'

gem 'rails', '3.2.14'

gem 'pg'

gem 'jquery-rails'

gem 'haml-rails'

# will need this gem to convert erb files generated by Devise
gem 'erb2haml' # then run: rake haml:replace_erbs

gem 'bcrypt-ruby', '~> 3.0.0'

gem 'will_paginate'

gem 'devise'
gem 'omniauth-google-oauth2'

gem 'feedzirra'

gem 'ruby-readability', :require => 'readability'
gem 'fastimage'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pry-rails'
  # gem 'pry-byebug'
  # gem 'pry-stack_explorer'
  gem 'annotate'
  gem 'quiet_assets'
  # gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem "rspec-rails"
  gem 'shoulda-matchers'
  gem "database_cleaner"
  gem "capybara"
  gem "factory_girl_rails"
  gem "faker"
end

group :test do
  gem 'simplecov', :require => false
end
