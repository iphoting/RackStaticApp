# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'rackstaticapp/version'

Gem::Specification.new do |s|
  s.name        = "rackstaticapp"
  s.version     = RackStaticApp::VERSION
  s.summary     = "An update to the Vienna, a tiny zero-config rack app to serve static files"
  s.description = "A tiny zero-config Rack App to serve static files"
  s.authors     = ["Ronald Ip", "Mikael Konutgan"]
  s.email       = "myself@iphoting.com"
  s.homepage    =
    "https://rubygems.org/gems/rackstaticapp"
  s.license       = "MIT"

  s.files       = `git ls-files`.split("\n")
  s.executables   = s.files.grep(/^bin\//) { |f| File.basename(f) }
  s.test_files    = s.files.grep(/^(test|spec|features)\//)
  s.require_paths = ['lib']

  s.add_runtime_dependency 'rack', '~> 2.0'
  s.add_runtime_dependency 'vienna', '~> 0.4.0'

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_development_dependency 'yard', '~> 0.9'
end
