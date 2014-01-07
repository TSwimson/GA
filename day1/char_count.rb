puts "Enter a phrase"
words = gets.chomp.split(" ")
word_lengths = words.map { |x| x.length}
word_lengths.each { |x| puts x.to_s}
