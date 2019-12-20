# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.7'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'

# ~
gem 'animate-rails'
gem 'cancancan'
gem 'cocoon'
gem 'colorize'
gem 'cpf_cnpj'
gem 'devise'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
gem 'jquery-rails'
gem 'material_icons'
gem 'materialize-sass'
gem 'ransack'
gem 'redis', '~> 3.0.0'
# ~

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
