munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


result = munsters.select do |key, val|
  val["gender"] == "male"
end

p result

total_age = result.reduce do |sum, (key,val)|
  sum + val["age"]
end

p total_age

numbers = {"Key1" => 1, "Key2" => 2, "Key3" => 3}

total = numbers.reduce(0) do |sum, (key,val)|
  sum + val
end

p total

