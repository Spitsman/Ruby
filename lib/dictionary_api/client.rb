<<<<<<< HEAD
require 'httpclient'

module DictionaryAPI

	class DictionaryAPI::Client

		BASE_URL = "https://dictionary.yandex.net/api/v1/dicservice.json/"

		def execute(path, options = {})
			response = HTTPClient.post(BASE_URL + path, options)	
			self.check_errors(response)
		end

	protected

		def check_errors(response)
			case response.code
			when 200 then response
			when 401 then raise 'Invalid API key'
			when 402 then raise 'API key blocked'
			when 403 then raise 'Daily limit of requests is exceeded'
			when 413 then raise 'Text too long'
			when 501 then raise 'Translate direction is not supported'
			end
		end
	end
	
end
=======
require 'httparty'

module DictionaryAPI

  class DictionaryAPI::Client

    attr_accessor :api_key

    BASE_URL = "https://dictionary.yandex.net/api/v1/dicservice.json/"

    def initialize(key)
      @api_key = key
    end

    def execute(path, options = {})
      response = HTTParty.post(self.build_url(path, options))    
      self.check_errors(response)
    end

  protected

    def check_errors(response)
      case response.code
      when 200 then response
      when 401 then raise 'Invalid API key'
      when 402 then raise 'API key blocked'
      when 403 then raise 'Daily limit of requests is exceeded'
      when 413 then raise 'Text too long'
      when 501 then raise 'Translate direction is not supported'
      end
    end

    def build_url(path, options = {})
      request = BASE_URL + path + "?key=#{@api_key}"
      options.each_pair { |key, value| request += '&' + key + '=' + value }
      request
    end 
  end
end
>>>>>>> 5b0163c7e4783932c0be52822d62054d4945dd2d
