puts "Ruby Methods"

def operate_on_numbers(op, *nums)
    result = case op.downcase
    when "add"
        nums.inject { |sum, x| sum + x }
    when "subtract"
        nums.inject { |diff, x| diff - x }
    when "multiply"
        nums.inject { |prod, x| prod * x }
    when "divide"
        nums.inject { |quot, x| quot / x }
    end
end

