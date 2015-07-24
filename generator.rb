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

gen = Generator.new
puts gen.create