#This is OaklandRocks to bad they are getting Michael Vick
puts "I'm thinking of a number between 1 and 100"
number = Random.new.rand(1..100)
trys = 0
while true
    print "What number am I thinking? "
    trys += 1
    user_guess = gets.to_i
    if user_guess == number
        break
    elsif number > user_guess
        puts "My number is higher than #{user_guess}"
    else
        puts "My number is lower than #{user_guess}"
    end
end
puts "You guessed it in #{trys} trys!"
