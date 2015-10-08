def brute_two_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)
  arr_sorted = arr.sort
end
