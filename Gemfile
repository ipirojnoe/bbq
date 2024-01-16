source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave', '~> 2.0'
gem 'devise', github: 'heartcombo/devise', branch: 'ca-omniauth-2'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'mailjet'

gem 'omniauth'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-rails_csrf_protection'

gem 'puma', '~> 4.1'
gem 'pundit', '2.1.0'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'rails-i18n'
gem 'resque'
gem 'rmagick'
gem 'webpacker', '~> 4.0'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.4'
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'annotate'
  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '~> 2.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.6'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'letter_opener_web'
  gem 'listen', '~> 3.2'
  gem 'pry'
end
