require_relative "lib/metus/version"

Gem::Specification.new do |spec|
  spec.name        = "metus"
  spec.version     = Metus::VERSION
  spec.authors     = ["Serge Hänni"]
  spec.email       = ["opensource@metikular.ch"]
  spec.homepage    = "https://www.metikular.ch"
  spec.summary      = "Highly opinionated business application framework"
  spec.license     = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/metikular/metus"
  spec.metadata["changelog_uri"] = "https://github.com/metikular/metus/raw/master/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end
