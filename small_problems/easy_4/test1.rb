century = 1

ORDER = {
  st: [1],
  nd: [2],
  rd: [3],
  th: [4,5,6,7,8,9]
}

ORDER.each do |key, val|
      p century.to_s + key.to_s  if val.include?(century)
      end