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

  arr_sorted.each_with_index do |el, i|
    diff = target_sum - el
    if bsearch(arr_sorted, diff, i + 1, arr_sorted.length - 1)
      return true
    end
  end
  
  false
end

def bsearch(arr, target, low_idx, high_idx)
  return false if low_idx > high_idx

  mid_idx = (high_idx + low_idx) / 2
  mid_el = arr[mid_idx]

  case mid_el<=>target
  when 1
    bsearch(arr, target, low_idx, mid_idx - 1)
  when -1
    bsearch(arr, target, mid_idx + 1, high_idx)
  when 0
    return true
  end
end

def hash_two_sum?(arr, target_sum)
  freq = Hash.new(0)
  arr.each do |el|
    freq[el] += 1
  end

  freq_two_sum?(freq, target_sum)
end

def freq_two_sum?(freq, target_sum)
  freq.each do |el, v|
    next if v == 0
    diff = target_sum - el
    return true if freq[diff] > 0 && (el != diff || freq[diff] > 1)
  end
  false
end

def arr_n_sum?(arr, target_sum, n)
  freq = Hash.new(0)
  arr.each do |el|
    freq[el] += 1
  end
  freq_n_sum?(freq, target_sum, n)
end

def freq_n_sum?(freq, target_sum, n)
  return freq_two_sum?(freq, target_sum) if n == 2
  freq.each do |k, v|
    next if v == 0
    # try out k
    freq[k] -= 1
    if freq_n_sum?(freq, target_sum - k, n - 1)
      return true
    end

    # reset things
    freq[k] += 1
  end
  false
end

arr = [5, 10, 25, 1, 4, 9, 3, 8, 7, 14, 92]
