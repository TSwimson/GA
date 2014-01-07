puts "Enter a string to be reversed "
words = gets.chomp
(0...words.length/2).each { |i| words[i], words[-i-1] = words[-i-1], words[i] }
puts words