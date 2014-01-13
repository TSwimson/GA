class Employee

    attr_accessor :name, :count

    @@count = 0

    def initialize(name)
        @name = name
        @@count += 1
        @vacation = false
    end

    def introduce
        "Hi, my name is #{@name}."
    end

    def self.get_count
        @@count
    end
    
    def self.resign
        @@count -= 1
    end

    def is_on_vacation?
        @vacation
    end

    def put_on_vacation
        @vacation = true
    end

    def come_back_from_vacation
        @vacation = false
    end
end