puts "Think of a number between 1 and 100"
min = 1
max = 100
trys = 0
while 1
    trys += 1
    guess = (min + max) / 2
    puts "is it #{guess}"
    response = gets.chomp
    if response == "lower"
        max = guess
    elsif response == "higher"
        min = guess
    else 
        break
    end
end
puts "I got it in #{trys} trys!"