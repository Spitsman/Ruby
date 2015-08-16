require "httparty"

class Dictionary
	attr_accessor :api_key
	def initialize(key)
		api_key = key
	end

	def get_langs
		url = "https://dictionary.yandex.net/api/v1/dicservice.json/getLangs?key=#{api_key}"
		response = HTTParty.get(url)
	end

	def lookup(lang, text)
		url = "https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=#{api_key}&lang=#{lang}&text=#{text}"
		response = HTTParty.get(url)
	end
end
