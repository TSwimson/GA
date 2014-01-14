class SortedArray
  attr_accessor :internal_arr # This is for convenience in the tests.

  def initialize(input_arr=[])
    @internal_arr = []
    input_arr.each { |x| add x }
    # Fill in the rest of the initialize method here.
    # What should you do with each element of the incoming array?
  end

  def add(new_ele)
    # Hint: Use the Array#insert method.
    @internal_arr.insert first_larger_index(new_ele), new_ele
  end

  def size
    @internal_arr.size
  end

  def [](index)
    @internal_arr[index]
  end

  def first_larger_index(target, start_ind=0, end_ind=@internal_arr.size)
    if start_ind >= end_ind
       return start_ind
    end

    middle_index = ((end_ind - start_ind)/2) + start_ind
    middle_element = @internal_arr[middle_index]

    if middle_element == target
      return middle_index
    elsif middle_element > target
      return first_larger_index(target, start_ind, middle_index)
    elsif middle_element < target
      return first_larger_index(target, middle_index + 1, end_ind)
    end
  end

  def index(target, start=0, ending=@internal_arr.length)
    if start >= ending
      return nil
    end

    middle_index = ((ending - start)/2) + start
    middle_element = @internal_arr[middle_index]

    if middle_element == target
      return middle_index
    elsif middle_element > target
       return index(target, start, middle_index)
    elsif middle_element < target
      return index(target, middle_index + 1, ending)
    end
  end

end
