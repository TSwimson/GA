require "./shape.rb"

class Square < Shape

    def initialize(side_length)
        super(4, [side_length, side_length, side_length, side_length])
        @side_length = side_length
    end

    def get_area
        return @side_length*@side_length
    end
end