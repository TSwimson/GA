puts "Enter a phrase to be framed"
words = gets.chomp.split " "

longest_word_length = 0
words.each { |w| longest_word_length = w.length if w.length > longest_word_length }
width = longest_word_length + 4
puts "*"*width
words.each { |w| puts "*" + w.center(width - 2) + "*"}
puts "*"*width