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
