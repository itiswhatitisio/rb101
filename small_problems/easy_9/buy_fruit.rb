def buy_fruit(arr)
  result = []
  arr.each do |item|
    item.each_with_index do |el, i|
      if el.to_s.match(/[0-9]/)
        el.times { result.push(item[i-1]) }
      end
    end
  end
  result
end