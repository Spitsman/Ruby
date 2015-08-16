require "httparty"

class Dictionary
	attr_accessor :api_key
	def initialize(key)
		@api_key = key
	end

	def connect(path, options = [])
		url = "https://dictionary.yandex.net/api/v1/dicservice.json/"
		url << path
		url << "?key=#{@api_key}"
		url << "&lang=#{options[0]}&text=#{options[1]}" unless options.empty?
		response = HTTParty.get(url)
	end

	def get_langs
		connect('getLangs')
	end

	def lookup(lang, text)
		connect('lookup', [lang, text])
	end
end

