source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 7.0.1'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'bootstrap', '~> 5.1.3'

gem 'stimulus-rails'

gem 'aasm', '~> 4.11'

gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5.1'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rubocop', '1.25.0'
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.2'
  gem 'rubocop-rails', '~> 2.13', '>= 2.13.2'
  gem 'shoulda-matchers', '~> 5.1'

  gem 'rspec', '~> 3.4'
end
