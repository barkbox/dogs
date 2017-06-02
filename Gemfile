source 'https://rubygems.org'

# Declare your gem's dependencies in bark-dog.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

gem 'acts_as_paranoid', '~> 0.5.0'
gem 'cloudinary'
gem 'paging_cursor', tag: "v0.2.0", git: "https://github.com/barkbox/paging_cursor.git"
gem 'rspec_api_documentation'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'factory_girl_rails', '~> 4.7'
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'database_cleaner'
end
