require "httparty"
require "./parser.rb"
#require "./test.rb"

class Dictionary
	attr_accessor :api_key
	def initialize(key)
		@api_key = key
	end

	def connect(path, options = [])
		url = "https://dictionary.yandex.net/api/v1/dicservice/"
		url << path
		url << "?key=#{@api_key}"
		url << "&lang=#{options[0]}&text=#{options[1]}" unless options.empty?
		response = HTTParty.get(url)
		check_errors(response) unless response.code == 200
		response
	end

	def get_langs
		connect('getLangs')
	end

	def lookup(lang, text)
		connect('lookup', [lang, text])
	end

	def check_errors(response)
		case response.code 
		when 401 then puts 'Invalid API key'
		when 402 then puts 'API key blocked'
		when 403 then puts 'Daily request limit exceeded'
		when 404 then puts 'Daily char limit exceeded'
    	when 413 then puts 'Text too long'
    	when 501 then puts 'Can\'t translate text in that direction'
		end
	end
end
	


