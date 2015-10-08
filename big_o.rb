def my_min(list)
  (0...list.length).each do |i|

    return list[i] if (i + 1...list.length).all? do |j|
      list[i] <= list[j]
    end
  end
end

def my_min(list)
  min = list.first
  (0...list.length).each do |i|
    min = list[i] if list[i] < min
  end
  min
end

def largest_contiguous_subsum(list)
  sub_arrays = []
  (0...list.length).each do |i|
    (i + 1...list.length).each do |j|
      sub_arrays << list[i...j]
    end
  end

  max = sub_arrays.first.reduce(:+)
  sub_arrays.each do |sub_arr|
    sub_sum = sub_arr.reduce(:+)
    max = sub_sum if sub_sum > max
  end

  max
end

def largest_contiguous_subsum(list)
  max = 0
  count = 0

  list.each do |el|
    count += el
    max = count if count > max
    count = 0 if count < 0
  end

  max
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
puts "my_min"
p my_min(list)  # =>  -5


list = [5, 3, -7]
puts "largest_contiguous_subsum"
p largest_contiguous_subsum(list) # => 8
