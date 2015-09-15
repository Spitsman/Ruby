require 'dictionary_api/article'
require 'dictionary_api/translation_article'

module DictionaryAPI

  class DictionaryAPI::Parser

    def parse(response)
      response['def'].inject([]) { |result, response_el| result << self.build_article(response_el) }
    end

  protected

    def build_article(some_hash)
      article = Article.new
      article.text = some_hash['text']
      article.position = some_hash['pos']
      article.transcription = some_hash['ts']
      article.translation = some_hash['tr'].inject([]) { |result, el| result << self.build_translation_article(el) }
      article
    end

    def build_translation_article(some_hash)
      translation_article = TranslationArticle.new
      translation_article.text = some_hash['text']
      translation_article.position = some_hash['pos']
      translation_article.synonym = self.build_string (some_hash['syn']) unless some_hash['syn'].class == NilClass
      translation_article.meaning = self.build_string(some_hash['mean']) unless some_hash['mean'].class == NilClass
      translation_article.example = self.build_string(some_hash['ex']) unless some_hash['ex'].class == NilClass
      translation_article.aspect = some_hash['asp']
      translation_article
    end
    
    def build_string(some_array)
      some_array.inject([]) do |result, element|      
        result << element.to_a.inject([]) do |result, el|
                   result << (el[1].class == Array ? self.build_string(el[1]) : el[1])
                 end
        result.flatten!
      end
    end
  end
end