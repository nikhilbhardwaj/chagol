# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chagol/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nikhil Bhardwaj"]
  gem.email         = ["root@NikhilBhardwaj.in"]
  gem.description   = %q{Chagol can send messages to any Indian mobile no}
  gem.summary       = %q{It can be used as a standalone command line tool or with other ruby libraries.}
  gem.homepage      = "https://github.com/nikhilbhardwaj/chagol"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "chagol"
  gem.require_paths = ["lib"]
  gem.version       = Chagol::VERSION
end
