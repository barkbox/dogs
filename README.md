# Dogs
Dogs is a rails engine that currently supports to storing of dog related data.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'dogs', git: 'https://github.com/barkbox/dogs.git'
```

And then execute:
```bash
$ bundle
```

### Migrations

- copy over migrations
    `bin/rake dogs:install:migrations`
- run migrations
  `bin/rake db:migrate`
  `bin/rake db:test:prepare`

### Mount
mount engine in `routes.rb`


TODO CONFIRM THAT THIS IS STILL NECESSARY NOW THAT ENGINE WAS CREATED WITH `--FULL`
e.g.
```
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount Dogs::Engine => "/"
    end
  end
end
```
this produces routes at `/api/v1/dogs`

note: where the engine is mounted within `routes.rb` matters. see `Mount Priority` here http://api.rubyonrails.org/classes/Rails/Engine.html 

### Add Cloudinary Credentials

1) download the yaml file here then retrieve the required keys from here `https://cloudinary.com/console/cloudinary.yml`
2) save keys with the env var names shown below to .env file if using locally or add to heroku config
3) adjust cloudinary.yml file to use keys
```
---
development:
  cloud_name: ENV['CLOUDINARY_CLOUD_NAME']
  api_key: ENV['CLOUDINARY_API_KEY']
  api_secret: ENV['CLOUDINARY_API_SECRET']
  enhance_image_tag: true
  static_image_support: false
production:
  cloud_name: ENV['CLOUDINARY_CLOUD_NAME']
  api_key: ENV['CLOUDINARY_API_KEY']
  api_secret: ENV['CLOUDINARY_API_SECRET']
  enhance_image_tag: true
  static_image_support: true
test:
  cloud_name: ENV['CLOUDINARY_CLOUD_NAME']
  api_key: ENV['CLOUDINARY_API_KEY']
  api_secret: ENV['CLOUDINARY_API_SECRET']
  enhance_image_tag: true
  static_image_support: false
```
4) save to `./config/cloudinary.yml`

## Api Docs
documentation found here https://github.com/barkbox/apidocs/blob/master/docs/dogs/index.markdown

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
