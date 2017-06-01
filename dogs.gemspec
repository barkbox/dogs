$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dogs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dogs"
  s.version     = Dogs::VERSION
  s.authors       = [""]
  s.email       = ["dev@barkbox.com"]
  s.homepage    = "https://github.com/barkbox/dogs"
  s.summary     = "Dogs Dogs Dogs"
  s.description = "Dog engine"

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "active_model_serializers", "0.10.4"
  s.add_dependency "acts_as_paranoid", "~> 0.5.0"
  s.add_dependency "cloudinary"
  s.add_dependency "paging_cursor"
  s.add_dependency "paper_trail", "~> 6"
  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.5"
  s.add_development_dependency "factory_girl_rails", "~> 4.7"
  s.add_development_dependency "rspec_api_documentation", "~> 4.9.0"
end
