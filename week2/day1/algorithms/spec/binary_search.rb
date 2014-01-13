def binary_search(array, target, start=0, ending=array.length)
  if start >= ending
    return nil
  end
  middle_index = ((ending - start)/2) + start
  middle_element = array[middle_index]
  if middle_element == target
    return middle_index
  elsif middle_element > target
     return binary_search(array, target, start, middle_index)
  elsif middle_element < target
    return binary_search(array, target, middle_index + 1, ending)
  end
end
