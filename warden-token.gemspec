$:.push File.expand_path("../lib", __FILE__)

require "warden/strategies/token"

Gem::Specification.new do |s|
  s.name        = "warden-token"
  s.version     = Warden::Strategies::Token::VERSION
  s.authors     = ["Tyler Margison"]
  s.email       = "kolorahl@gmail.com"
  s.homepage    = "https://github.com/kolorahl/warden-token"
  s.summary     = "Simple token authentication strategy for Warden."
  s.description = "Simple token authentication strategy for Warden. Not necessarily secure or powerful, this is for simple token-based authentication like what you might need for an API project."
  s.license     = "MIT"

  s.files = Dir["lib/**/*", "LICENSE", "README.md"]

  s.add_dependency "warden", "~> 1.2"
end
