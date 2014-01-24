class Base35Converter
    alpha = ('a'..'z').to_a + ('1'..'9').to_a
    indexes = (0..35).to_a

    @@alphaHash = Hash[indexes.zip alpha]
    @@reverseHash = Hash[alpha.zip indexes]

    def to_35 (input)
        digits = []
        while input > 0
            r = input % 35
            digits.push r
            input = input / 35
        end
        digits.reverse!
        digits.map { |d| @@alphaHash[d] }
    end

    def to_10 (input)
        o = input.split("").map { |d| @@reverseHash[d] }.reverse!
        a = 0
        o = o.each_with_index do |x, i|
            x = x * (35**i) if i > 0
            a += x
        end
        a
    end
end