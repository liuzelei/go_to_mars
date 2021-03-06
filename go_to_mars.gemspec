# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'go_to_mars/version'

Gem::Specification.new do |spec|
  spec.name          = "go_to_mars"
  spec.version       = GoToMars::VERSION
  spec.authors       = ["liuzelei"]
  spec.email         = ["liuzelei@gmail.com"]
  spec.summary       = '提供WGS84到火星坐标系的转换'
  spec.description   = '天朝万岁万万岁.'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
end