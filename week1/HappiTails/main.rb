require "./shelter.rb"
def ok
    print "press enter to continue"
    gets
end
shelter = Shelter.new true
puts "Welcome"
while true
    options = ["display all animals",
             "display all clients", 
             "create an animal", 
             "create an client", 
             "facilitate client adopts an animal", 
             "facilitate client puts an animal up for adoption",
             "Exit"]
    options.each_with_index { |o, i| puts "#{i+1}. #{o}"}
    case gets.to_i
    when 1 
        puts shelter.display_animals
        ok
    when 2 
        puts shelter.display_clients
        ok
    when 3 
        shelter.add_animal
        ok
    when 4 
        shelter.add_client
        ok
    when 5 
        shelter.client_adopts_animal
        ok
    when 6 
        shelter.client_puts_animal
        ok
    when 7
        break
    else
        puts "Try again"
        ok
    end
    puts `clear`
end




