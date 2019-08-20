$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pagehook-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pagehook-rails"
  s.version     = PagehookRails::VERSION
  s.authors     = ["labocho"]
  s.email       = ["labocho@penguinlab.jp"]
  s.homepage    = "https://github.com/labocho/pagehook-rails"
  s.summary     = "Rails plugin integrates Pagehook (https://github.com/labocho/pagehook)"
  s.description = "Rails plugin integrates Pagehook (https://github.com/labocho/pagehook)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.1"
  s.add_dependency "loofah", ">= 2.2.3" # avoid CVE-2018-16468
  s.add_dependency "nokogiri", ">= 1.10.4" # avoid CVE-2019-5477
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "bootsnap"
  s.add_development_dependency "listen"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3", "~> 1.4"
end
