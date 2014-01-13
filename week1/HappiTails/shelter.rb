    require "./animal.rb"
require "./client.rb"

def clean_array a
    a.reject! { |i| i == nil }
end

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
        r = ""
        @clients.each_with_index { |c, i| r += "#{i + 1}. #{c.description}\n" }
        r
    end

    def display_animals
        r = ""
        @animals.each_with_index { |a, i| r += "#{i + 1}. #{a.description}\n" }
        r
    end

    def client_adopts_animal
        puts "Which client is adopting an animal?"
        puts display_clients
        c = gets.to_i - 1
        @clients[c].add_animal
        puts "Which animal is being adopted?"
        puts display_animals
        a = gets.to_i - 1
        @animals[a] = nil
        @animals = clean_array @animals
    end

    def client_puts_animal
        puts "Which client is putting their animal up for adoption?"
        puts display_clients
        c = gets.to_i - 1
        @clients[c].remove_animal
        add_animal
        
    end
end