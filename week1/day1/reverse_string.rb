puts "Enter a string to be reversed "
words = gets.chomp.split " "
words.each { |word| (0..word.length/2).each { |i| word[i], word[-i-1] = word[-i-1], word[i] } }
words.each { |x| print x + " " }
puts "\n"