class Person
    @@population = []
    # attr_reader :name, :age
    # attr_writer :name, :age

    attr_accessor :name, :age

    def initialize(name="NA")
        @name = name
        @@population << self
    end

    def self.get_pop
        @@population.length
    end
end
