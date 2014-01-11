# The shelter should display all the clients.
# The shelter should display all the animals.
# The shelter should display all the animals
require "./animal.rb"
require "./client.rb"
class Shelter
    attr_accessor :clients, :animals

    def initialize use_default_starting_clients_and_animals=false
        @clients = []
        @animals = []
        if use_default_starting_clients_and_animals
            @animals << Animal.new("Scout", 13, "female", "dog")
            @animals << Animal.new("Sally", 2, "female", "cat")
            @clients << Client.new("Tanner", 19, 0, 1)
            @clients << Client.new("Jon", 76, 2, 1)
        end
    end

    def add_animal
        puts "Enter the name, age, gender, and species for the animal"
        info = gets.chomp.split
        @animals << Animal.new(info[0], info[1], info[2], info[3])
    end

    def add_client
        puts "Enter the name, age, number of children, and number of pets for the client"
        info = gets.chomp.split
        @clients << Client.new(info[0], info[1], info[2], info[3])
    end

    def display_clients
        clients.inject ("") { |s, c| s << c.description + "\n" }
    end

    def display_animals
        animals.inject ("") { |s, a| s << a.description + "\n" }
    end
end