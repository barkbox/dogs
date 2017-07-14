# Dogs
Dogs is a rails engine that currently supports the storing of dog related data.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'dogs', github: 'barkbox/dogs', tag: '0.1.0'
```

And then execute:
```bash
$ bundle
```

### Configuration
In an initializer file you need to specify which Rails controller the DogsController will inherit from. This inheritance ensures the DogsController has access to the authentication and authorization methods it depends on (see below).

```ruby
Dogs.configure do |config|
  config.base_api_controller = Api::V2::ApiController
end
```

### Migrations

- copy over migrations
  `rake dogs_engine:install:migrations`
- run migrations
  `rake db:migrate`
  `rake db:test:prepare`

### Setting up routes
No routes are provided by the engine by default. You can set them up in the host app as you would a normal set of routes: 
```
resources :dogs, except: [:new, :edit]
```
or
```
get 'api/v2/dogs',        to: 'dogs#index'
post 'api/v2/dogs',       to: 'dogs#create'
get 'api/v2/dogs/:id',    to: 'dogs#show'
put 'api/v2/dogs/:id',    to: 'dogs#update'
patch 'api/v2/dogs/:id',  to: 'dogs#update'
delete 'api/v2/dogs/:id', to: 'dogs#destroy'
```
Because the `dogs#index` action will return all dogs for a specific user if a `user_id` is passed in the parameters, you can additionally provide this route if you wish to explicitly nest it under a user:

```
get 'api/v2/users/:user_id/dogs',   to: 'dogs#index'
```

Similarly, the POST action requires a `user_id`, and can therefore also have the `user_id` in the route:

```
post 'api/v2/users/:user_id/dogs',  to: 'dogs#create'
```

**NOTE:**
when namespaced as below, Rails will end up looking for a controller at `/api/v2/dogs_controller.rb` which does not exist. DO NOT DO THIS.
```
namespace :api do
  namespace :v2 do
    resources :dogs, except[:new, :edit]
  end
end
```
### Authentication/Authorization
  The host app **must** define the four methods below in or up the inheritance chain from whichever controller you specify in the configuration.

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

  It is also highly recommended that you provide a method in your inherited controller (or somewhere up its inheritance chain) like the one below, to adhere with the JSONAPI standards for errors. This is an example:

  ```
  def catch_errors
    yield
  rescue BarkboxClient::UnauthenticatedError => e
    json = { errors: [ { status: '401', title: e.message } ] }
    render json: json, status: :unauthorized
  rescue => e
    json = { errors: [ { status: '400', title:  e.message } ] }
    render json: json, status: :bad_request
  end
  ```

  The `catch_errors` method can be triggered in an around filter:

  ```
  around_filter :catch_errors
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
  It is strongly advised to implement the [PaperTrail](https://github.com/airblade/paper_trail) gem in the host app. After installing the gem put the following in an initializer file.
  ```
  class Dog
    has_paper_trail
  end
  ```

  The Dogs Engine also uses [Acts As Paranoid](https://github.com/ActsAsParanoid/acts_as_paranoid), which allows for soft deletion of records, making them recoverable later.

## Api Docs
documentation found here https://github.com/barkbox/apidocs/blob/master/docs/dogs/index.markdown

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
