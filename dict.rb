require "httparty"

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

dict = Dictionary.new('dict.1.1.20150814T100205Z.a0d27651d642b1d1.93ce6ba9cd891aada1fb98d47b6cd89c15a32f2e')
dict.get_langs
dict.lookup('en-ru', 'cat')