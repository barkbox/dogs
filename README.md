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
    `bin/rake dogs_engine:install:migrations`
- run migrations
  `bin/rake db:migrate`
  `bin/rake db:test:prepare`

### Accessing routes
Since the Dogs::Engine was created as a full plugin (vs mountable), no action is additional action is required in the host app to have access to the routes at `/dogs`

### Authentication/Authorization
  The host app **must** define the four methods below in or up the inheritance chain from `ApplicationController`. The engine will look in the host's `ApplicationController` first.

  example implementations are:  

  ```
  def authenticate
    raise BarkboxClient::UnauthenticatedError if current_user.nil?
  end
  ```
  ```
  def authenticate_admin
    raise BarkboxClient::UnauthenticatedError if current_user.nil? || !current_user.is_admin?
  end
  ```
  ```
  def authorize_for_resource(resource)
    return if current_user.is_admin
    return if resource.is_a?(User) && resource.id == current_user.id
    if current_user.id != resource.try(:user_id)
      raise 'Unauthorized for resource'
    end
  end
  ```

  ```
  def authorize_for_resources(resources)
    return if current_user.is_admin
    if resources.where.not(user_id: current_user.id).present?
      raise 'Unauthorized for resource'
    end
  end
  ```
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

## Notes 
  strongly advised to implement the [PaperTrail](https://github.com/airblade/paper_trail) gem in the host app. After installing gem put the following in an initializers
  ```
  class Dog
    has_paper_trail
  end
  ```
## Api Docs
documentation found here https://github.com/barkbox/apidocs/blob/master/docs/dogs/index.markdown

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
