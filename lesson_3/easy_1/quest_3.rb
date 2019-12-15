advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
puts advice.object_id

advice["important"] = "urgent"
puts advice
puts advice.object_id

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
puts advice.object_id

advice.gsub!("important", "urgent")
puts advice
puts advice.object_id