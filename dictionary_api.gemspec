# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dictionary_api/version'

Gem::Specification.new do |spec|
  spec.name          = "dictionary_api"
  spec.version       = DictionaryAPI::VERSION
  spec.authors       = ["spitsman"]
  spec.email         = ["sanspits@yandex.ru"]

  spec.summary       = %q{'getLangs and lookup methods'}
  spec.homepage      = "https://github.com/Spitsman/dictionary_api"
  spec.license       = "MIT"

  spec.files         = ['lib/dictionary_api.rb', 'lib/dictionary_api/client.rb', 'lib/dictionary_api/parser.rb', 'lib/dictionary_api/article.rb', 'lib/dictionary_api/translation_article.rb']  
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = ['spec/dictionary_api_spec.rb', 'spec/lib/parser_spec.rb', 'spec/lib/client_spec.rb']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_dependency "httparty", "~> 0.13"
  spec.add_dependency "json", "~> 1.8"
end
