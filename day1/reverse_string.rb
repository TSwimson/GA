puts "Enter a string to be reversed "
words = gets.chomp.split " "
words.each do |word|
    for i in 0..word.length/2
        a = word[i]
        word[i] = word[-i-1]
        word[-i-1] = a
    end
end
words.each { |x| print x + " "}
puts "\n"