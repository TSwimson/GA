class SortedArray
  attr_reader :internal_arr

  def initialize arr=[]
    @internal_arr = []
    arr.each { |el| add el }
  end

  def add el
    # we are going to keep this array
    # sorted at all times. so this is ez
    lo = 0
    hi = @internal_arr.size
    # note that when the array just
    # starts out, it's zero size, so
    # we don't do anything in the while
    # otherwise this loop determines
    # the position in the array, *before*
    # which to insert our element
    while lo < hi
      # let's get the midpoint
      mid = (lo + hi) / 2
      if @internal_arr[mid] < el
        # if the middle element is less 
        # than the current element
        # let's increment the lo by one
        # from the current midway point
        lo = mid + 1
      else
        # otherwise the hi *is* the midway 
        # point, we'll take the left side next
        hi = mid 
      end
    end

    # insert at the lo position
    @internal_arr.insert(lo, el)
  end

  def each &block
    i = 0
    while i < @internal_arr.size
      yield @internal_arr[i]
      i += 1
    end
    @internal_arr
  end

  def map #&block
    ret = []
    # i = 0
    # tmp = @internal_arr.dup
    # while i < tmp.size
    #   ret.push yield tmp[i]
    #   i += 1
    # end
    each { |x| ret.push yield x}
    return ret
  end

  def map! &block
    @internal_arr = map &block
  end

  def find value=nil
    each{ |x| return x if yield x}
    return value
  end

  def inject acc=0, &block
    each{ |x| acc = (yield acc, x) }
    return acc
  end
end