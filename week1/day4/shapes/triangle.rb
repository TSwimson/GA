require "./shape.rb"

class Triangle < Shape

    def initialize(side_lengths)
            super(3, side_lengths)
            
    end

    # def get_area
    #     return base*height*0.5
    # end

end