source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'pundit', '2.1.0'
gem 'devise'
gem 'rails-i18n'
gem 'devise-i18n'
gem 'carrierwave', '~> 2.0'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'
gem 'dotenv-rails'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 3.4'
  gem 'factory_bot_rails'
end

group :development do
  gem 'letter_opener_web'
  gem 'annotate'
  gem 'pry'
  gem 'listen', '~> 3.2'

  gem 'capistrano', '~> 3.10'
  gem 'capistrano-bundler', '~> 2.0'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rails', '~> 1.6'
  gem 'capistrano-rbenv', '~> 2.1'
end
