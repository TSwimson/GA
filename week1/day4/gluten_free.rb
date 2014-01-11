
class AllergyError < StandardError

end

class Person

    attr_reader :stomach
    def initialize(allergy=nil)
        @stomach = []
        @allergy = allergy
    end

    def eat food
        @stomach.concat food
        begin
            raise AllergyError.new if food.include? @allergy
        rescue AllergyError => error
            @stomach = []
            puts error.to_s + " I cannot eat " + @allergy
        end

    end
end



pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new("gluten")
beth = Person.new("scallops")

puts "Feeding chris water"
chris.eat(water)
puts "Chris's stomach contains: " + chris.stomach.to_s
puts "Feeding chris pizza"
chris.eat(pizza)
puts "Chris's stomach contains: " + chris.stomach.to_s
puts "Feeding chris pan seared scallops"
chris.eat(pan_seared_scallops)
puts "Chris's stomach contains: " + chris.stomach.to_s

# puts "Feeding beth water"
# beth.eat(water)
# puts "beth's stomach contains: " + beth.stomach.to_s
# puts "Feeding beth pizza"
# beth.eat(pizza)
# puts "beth's stomach contains: " + beth.stomach.to_s
# puts "Feeding beth pan seared scallops"
# beth.eat(pan_seared_scallops)
# puts "beth's stomach contains: " + beth.stomach.to_s
