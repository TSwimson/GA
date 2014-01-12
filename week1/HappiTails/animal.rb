
class Animal

    def initialize name, age, gender, species 
        @name = name
        @age = age
        @gender = gender
        @species = species
        @toys = []
    end

    def description
        "#{@name} is a #{@age} year old #{@gener} #{@species}"
    end
end