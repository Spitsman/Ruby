class Generator
  Suffixes = ['less', 'ness', 'ing', 'er', 're', 'tion', 'ly', 'tant','en', 'tic']
  Vowels = ['a','e','i','o','u']
  Consonants = ['b','c','d','f','g','h','k','l','m','n','p','q','r','s','t','v','w','z'] 
  def create
    str = ""
    puts "Enter length"
    len = gets
    while str.size <= len.to_i
      str  << Consonants[rand(Consonants.size)] 
      str << Vowels[rand(Vowels.size)]
    end
    str << Suffixes[rand(Suffixes.size)]
    str << rand(48..57)
    str << rand(48..57)
  end
end

class Dictionary
	attr_accessor :password
	def initialize(pass)
		@password=pass
	end
	def getLangs(key)
		if key!=@password
			puts "Error"
			return
		end
		["ru-ru","ru-en","ru-pl","ru-uk","ru-de","ru-fr","ru-es","ru-it","ru-tr","en-ru","en-en","en-de","en-fr","en-es","en-it","en-tr","pl-ru","uk-ru","de-ru","de-en","fr-ru","fr-en","es-ru","es-en","it-ru","it-en","tr-ru","tr-en"]
	end
	def lookup(key, text, lang)#lang - направление перевода, text - искомый текст
		if key!=password
			puts "Error"
			return
		end
	end
end

gen = Generator.new
dict = Dictionary.new(gen.create)
puts dict.password
puts dict.getLangs("qwer")