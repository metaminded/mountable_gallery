$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mountable_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mountable_gallery"
  s.version     = MountableGallery::VERSION
  s.authors     = ["Peter Horn, metaminded UG"]
  s.email       = ["ph@metaminded.com"]
  s.homepage    = "https://github.com/metaminded/mountable_gallery"
  s.summary     = "A MountableGallery."
  s.description = "A Gallery that can be mounted on ActiveRecord models."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.textile"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "rails_misc" #, git: "http://github.com/metaminded/rails-misc"

  s.add_development_dependency "sqlite3"
end
