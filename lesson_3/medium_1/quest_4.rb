def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  # + doesn't modify the input_array
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

p rolling_buffer1([1,2,3],10,4)

p rolling_buffer2([1,2,3],10,4)
