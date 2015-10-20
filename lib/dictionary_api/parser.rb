require 'dictionary_api/article'
require 'dictionary_api/translation_article'

module DictionaryAPI

	class DictionaryAPI::Parser

		def parse(response)
			response['def'].inject([]) { |result, response_el| result << self.build_article(response_el) }
		end

	protected

		def build_article(articles_hash)
			article = Article.new
			article.text = articles_hash['text']
			article.position = articles_hash['pos']
			article.transcription = articles_hash['ts']
			article.translation = articles_hash['tr'].inject([]) { |result, el| result << self.build_translation_article(el) }
			article
		end

		def build_translation_article(articles_hash)
			translation_article = TranslationArticle.new
			translation_article.text = articles_hash['text']
			translation_article.position = articles_hash['pos']
			translation_article.synonym = self.build_array(articles_hash['syn']) unless articles_hash['syn'].nil?
			translation_article.meaning = self.build_array(articles_hash['mean']) unless articles_hash['mean'].nil?
			translation_article.example = self.build_array(articles_hash['ex']) unless articles_hash['ex'].nil?
			translation_article.aspect = articles_hash['asp']
			translation_article
		end
		
		def build_array(articles_array)
			articles_array.inject([]) do |result, element|      
				result << element.to_a.inject([]) do |result, el|
									  result << (el[1].class == Array ? self.build_array(el[1]) : el[1])
								  end
				result.flatten!
			end
		end
	end
<<<<<<< HEAD
end
=======
end
>>>>>>> 5b0163c7e4783932c0be52822d62054d4945dd2d
