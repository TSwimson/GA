puts "Enter a phrase to be framed"
words = gets.chomp.split " "

longest_word_length = words.map { |w| w.length}.max

width = longest_word_length + 4

puts "*"*width
words.each { |w| puts "*" + w.center(width - 2) + "*"}
puts "*"*width