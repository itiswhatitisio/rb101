def sequence(count, num)
  Array.new(count, num).map.with_index { |n, i| p n * (i + 1) }
end