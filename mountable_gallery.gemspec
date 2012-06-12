$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mountable_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mountable_gallery"
  s.version     = MountableGallery::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MountableGallery."
  s.description = "TODO: Description of MountableGallery."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  s.add_dependency "rails_misc" #, git: "http://github.com/metaminded/rails-misc"

  s.add_development_dependency "sqlite3"
end
