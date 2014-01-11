# The shelter should display all the clients.
# The shelter should display all the animals.
# The shelter should display all the animals
require "./animal.rb"
require "./client.rb"
class Shelter
    attr_accessor :clients, :animals

    def initialize
        @clients = []
        @animals = []
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
end