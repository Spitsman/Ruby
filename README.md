##API for Yandex Dictionary: getLangs & lookup methods

##Example:

```ruby
require 'dictionary_api'

key = 'dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e'
d = DictionaryAPI::DictionaryAPI.new(key)
articles_array = d.lookup('en-ru', 'time')
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dictionary_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dictionary_api




## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

