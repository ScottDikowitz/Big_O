def windowed_max_range(array, window_size)
  current_max_range = nil

  (0..array.length - window_size).each do |i|
    sub_array = array[i...i + window_size]
    range = sub_array.max - sub_array.min

    if current_max_range.nil? || range > current_max_range
      current_max_range = range
    end
  end

  current_max_range
end
