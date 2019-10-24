=begin

# Problem

Input
- length_room = interer (in meters)
- width_room = integer (in meters)

Output
- area_room = integer in square meters and convert to square meters

# Requirements
- no input validation is required
- area_room = length_room * width_room
- 1 sq.m. = 10.7639 sq.ft.

# Examples/Test cases
- length_room = 10;
- width_room = 7;
- area_room_meters = 70.0
- area_room_sq_feet = 753.47

# Data structure
- integer

# Algorithm

- get the length
- get the width
- calculate the area
- convert to sq.f.

=end

SQMETERS_TO_SQFEET = 10.7639;

Kernel.puts("Enter the length of the room in meters:")
length_room = Kernel.gets().to_f

Kernel.puts("Enter the width of the room in meters:")
width_room = Kernel.gets().to_f

area_room_meters = length_room * width_room;
area_room_sq_feet = area_room_meters * SQMETERS_TO_SQFEET;

Kernel.puts("The area of the room is #{area_room_meters.round(2)} square meters (#{area_room_sq_feet.round(2)} square feet).")
