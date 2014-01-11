# An animal should have a name.
# An animal should have an age.
# An animal should have a gender.
# An animal should have a species.
# An animal can have multiple toys.

class Animal

    def initialize(name, age, gender, species)
        @name = name
        @age = age
        @gender = gender
        @species = species
        @toys = []
    end