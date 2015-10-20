require 'json'
require 'dictionary_api/client'
require 'dictionary_api/parser'

module DictionaryAPI

<<<<<<< HEAD
	class DictionaryAPI

		attr_accessor :api_key

		def initialize(key)
			@api_key = key
		end

		def get_langs
			JSON.parse client.execute('getLangs', {key: @api_key}).body
		end

		def lookup(lang, text)
			response = JSON.parse client.execute('lookup', {key: @api_key, lang: lang, text: text}).body
			parser.parse(response)
		end

	protected

		def client	
			@client ||= Client.new
		end

		def parser
			@parser ||= Parser.new
		end
	end 
end
=======
  class DictionaryAPI

    attr_accessor :api_key

    def initialize(key)
      @api_key = key
    end

    def get_langs
      JSON.parse client.execute('getLangs').body
    end

    def lookup(lang, text)
      text.gsub!(' ', '%20')
      response= JSON.parse client.execute('lookup', {'lang'=>lang, 'text'=>text}).body
      parser = Parser.new
      parser.parse(response)
    end

  protected

    def client  
      @client ||= Client.new(api_key)
    end
  end 
end
>>>>>>> 5b0163c7e4783932c0be52822d62054d4945dd2d
