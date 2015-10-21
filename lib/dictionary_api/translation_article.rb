module DictionaryAPI

  class TranslationArticle
  	
    attr_accessor :text, :position, :gender, :animated, :synonym, :meaning, :example, :aspect
  	
  	def attributes
	  	{text: text, position: position, gender: gender, animated: animated, synonym: synonym, meaning: meaning, example: example, aspect: aspect}
	  end

  end

end