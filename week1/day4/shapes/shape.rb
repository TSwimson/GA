class Shape

    def initialize(number_of_sides=0, side_lengths)
        @number_of_sides = number_of_sides
        @side_lengths = side_lengths
    end 

    def get_perimeter
        return @side_lengths.inject { |sum, x| sum + x }
    end

end
