=begin

# Problem:

# Requirements:
- convert angle in degrees into degrees, minutes, seconds
- degree symbol: DEGREE = "\xC2\xB0"
- degree = 60 minutes
- 1 minutes = 60 seconds

# Input:
- floating point number

# Output:
- string in the format %(30°00'00")

# Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# Data structure/Algorithm:
- integer
- degree_in_minutes = degree * number of minutes
- degree, total_minutes_seconds = degree_in_minutes.divmod(60)
- convert total_minutes_seconds to seconds
  - total_seconds = minutes * 60
  - seconds = seconds % 60

=end

DEGREE = "\xC2\xB0"
MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTES = 60

def dms(angle)
  degree_in_minutes = angle * MINUTES_IN_DEGREE
  degree, total_min_sec = degree_in_minutes.divmod(MINUTES_IN_DEGREE)
  total_seconds = total_min_sec * SECONDS_IN_MINUTES
  seconds = total_seconds % SECONDS_IN_MINUTES
  format(%(%d#{DEGREE}%02d'%02d"),
         degree, total_min_sec.floor, seconds.floor)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
