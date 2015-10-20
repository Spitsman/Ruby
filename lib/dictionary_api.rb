require 'json'
require 'dictionary_api/client'
require 'dictionary_api/parser'

module DictionaryAPI

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

