# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redirect_follow_get/version'

Gem::Specification.new do |spec|
  spec.name          = "redirect_follow_get"
  spec.version       = RedirectFollowGet::VERSION
  spec.authors       = ["Toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{redirect_follow_get is simple http get method following redirect.}
  spec.description   = %q{redirect_follow_get is simple http get method following redirect.}
  spec.homepage      = "https://github.com/toshimaru/redirect_follow_get"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "addressable", "~> 2.5"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
end
