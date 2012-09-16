# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Norbert Wojtowicz"]
  gem.email         = ["wojtowicz.norbert@gmail.com"]
  gem.description   = %q{Just another Ruby on Rulers}
  gem.summary       = %q{Just another Ruby on Rulers - rebuilding Rails from scratch}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rulers"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.4'

  gem.add_runtime_dependency "rack"
  gem.add_runtime_dependency "erubis"

  gem.add_development_dependency "rspec"
end
