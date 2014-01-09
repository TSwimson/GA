#ProjectEuler.net Problem 4 Find the largest palindrome made from the product of two 3-digit numbers.

a = []

999.step(0, -1) do |x|
    999.step(0, -1) do |y|
        if (x*y).to_s == (x*y).to_s.reverse
            a.push x*y
        end
    end
end

puts a.max