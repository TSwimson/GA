require "./animal.rb"
#cat inherits Animal
class Cat < Animal

    def initialize(age=10,gender="m",name="Tom")
        @age = age
        @gender = gender
        @name = name
    end

    def speak
        super
        puts "meow"
    end

end