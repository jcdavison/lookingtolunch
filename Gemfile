source 'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.1'
gem 'haml-rails'
gem 'pg', '~> 0.17.1'
gem 'thin', '~> 1.6.1'
gem 'rabl'
gem 'underscore-rails'
gem 'firebase'
gem 'rest_client'
gem 'aasm'
gem 'sidekiq'
gem 'sinatra', '>= 1.3.0', :require => nil

#assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'foundation-rails'
gem 'font-awesome-rails'

#javascript
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 1.2'
gem 'angularjs-rails', '~> 1.2.7'
gem 'ngmin-rails', '~> 0.4.0'

#user auth
gem 'devise', '3.0.0'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'uuidtools'


#misc tools
gem 'twitter'

#heroku
gem 'rails_12factor'

group :development, :test do
  gem 'capybara-webkit', github: 'thoughtbot/capybara-webkit', branch: 'master'
  gem 'rspec-rails', '~> 2.14.1'
  gem 'factory_girl_rails', '4.2.1'
  gem 'mocha', '~> 1.0.0'
  gem 'pry'
  gem 'pry-debugger'
  gem 'quiet_assets'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :development do 
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'better_errors'
  gem 'terminal-notifier-guard'
  gem 'spring', '~> 1.1.2'
  gem "spring-commands-rspec", group: :development
end

group :test do
  gem 'launchy', '>= 2.1.2'
  gem 'capybara', '>= 1.1.3'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'shoulda-matchers'
  gem 'pdf-inspector'
  gem 'selenium-webdriver'
end
