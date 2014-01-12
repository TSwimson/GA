
class Client

    def initialize name, age, number_of_children, number_of_pets
        @name = name
        @number_of_children = number_of_children
        @age = age
        @number_of_pets = number_of_pets
    end

    def description
        "#{@name} is a #{@age} year old with #{@number_of_pets} pets and #{@number_of_children} children"
    end

    def add_animal
        @number_of_pets += 1
    end

    def remove_animal
        @number_of_pets -= 1
    end

end