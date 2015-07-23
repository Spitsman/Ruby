class Generator
  def create
    suffixes = ['less', 'ness', 'ing', 'er', 're', 'tion', 'ly', 'tant','en', 'tic']
    vowels = ['a','e','i','o','u']
    consonants = ['b','c','d','f','g','h','k','l','m','n','p','q','r','s','t','v','w','z'] 
    str = ""
    while str.size <= rand(3..5)
      str  << consonants[rand(consonants.size)] 
      str << vowels[rand(vowels.size)]
    end
    str << suffixes[rand(suffixes.size)]
    str << rand(48..57)
    str << rand(48..57)
    puts str
  end
end

gen = Generator.new
gen.create