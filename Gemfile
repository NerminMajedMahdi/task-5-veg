source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'

# Use Puma as the app server
gem 'puma', '~> 3.11.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
#gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'therubyracer', '~> 0.12.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'turbolinks', '~> 5'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
gem 'redis-rails'



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rails-controller-testing'
gem 'stripe'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
 gem 'byebug', platform: :mri
 gem 'rspec-rails'
 gem "factory_bot_rails", "~> 4.0"
gem "brakeman", :require => false

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
 gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# added to start starting page in 3.8 cf
gem 'coffee-script-source', '1.8.0'


group :development, :test do
  gem 'sqlite3'
end




# added Postgres QL databases for Heroku server 3.10 cf
group :production do
  gem 'pg'
gem 'rails_12factor'
end

# 5.4 for authentication
gem 'devise'

# 5.5 for authorization
gem 'cancancan', '~> 1.10'

# 5.9 for pagination
gem 'will_paginate', '~> 3.1.0'



