#lecture notes

def gen_times(factor)
  return Proc.new { |n| n*factor}
end

def example
  yield if block_given?
end

def example &block
  puts block.inspect
end


def my_inject array, initial=array[0], &block
  sum = 0
  array.each { |x| sum = yield sum,x }
  return sum
end

my_inject([0,1,2,3]) {|sum, x| sum + x} # = 6
p = Proc.new { |name| puts "Hello, #{name}"}
p.call("Tanner")

times3 = gen_times(3)
puts times3.call(6)

2.send(:+,3) # 2 + 3 = 5
addition = :+.to_proc
addition.call(2,3)
