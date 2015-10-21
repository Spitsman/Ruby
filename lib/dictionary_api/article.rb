module DictionaryAPI

  class Article

    attr_accessor :text, :position, :transcription, :translation

    def attributes
  	  {text: text, position: position, transcription: transcription}
	  end

  end

end