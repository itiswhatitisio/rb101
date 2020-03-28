=begin

Problem:
Take a time using minute based format and return the time of the day
in 24-h format

# Requirements
- time of day - number of minutes before or after the midnight
- positive integer -> time after midnight
- negative integer -> time before midnight
- return the time in 24-h format
- method should work with any integer
- do not use ruby's Date and Time classes
- minutes per hour = 60
- hours in a day = 24
- minutes per day = 1440

# Input
- integer
- positive integer -> time after midnight
- negative integer -> time before midnight

# Output
- string
- time in 24-h format

# Examples:
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

# Data structures/Algorithm

- find out how many hours are in the minutes
  - format_hours = minutes/60
- find out how many minutes remaining
  - format_minutes = minutes%60

=end

def time_of_day(minutes)
  if minutes >= -1440 && minutes < 0
    minutes_new = 1440 + minutes
    format_hours = minutes_new / 60
    format_minutes = minutes_new % 60
    return format('%02d:%02d', format_hours, format_minutes)
  elsif minutes < -1440
    minutes_new = minutes % 1440
    format_hours = minutes_new / 60
    format_minutes = minutes_new % 60
    return format('%02d:%02d', format_hours, format_minutes)
  end

  if minutes >= 0 && minutes <= 1440
    format_hours = minutes / 60
    format_minutes = minutes % 60
    return format('%02d:%02d', format_hours, format_minutes)
  elsif minutes > 1440
    format_hours = minutes / 1440
    format_minutes = minutes % 60
    return format('%02d:%02d', format_hours, format_minutes)
  end
end

# Refactoring

MINUTES_HOUR = 60
MINUTES_DAY = 60 * 24

def time_of_day_refactored(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_DAY # handling negative integers
  hours, minutes = delta_minutes.divmod(MINUTES_HOUR) # quotient (number of times a divisor can 'fit' the dividend) and remainder
  format('%02d:%02d', hours, minutes)
end

p time_of_day_refactored(-1437)
p time_of_day_refactored(3000)


# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# Further exploration - using Time and Date classes

require 'time'
require 'date'

def time_of_day1(minutes)
  day = Time.new(2020, 3, 15)
  seconds = minutes * 60
  new_day = day + seconds
  p new_day.strftime('%A %R')
end

time_of_day1(0)
time_of_day1(-3)
time_of_day1(35)
time_of_day1(-1437)
time_of_day1(3000)
time_of_day1(800)
time_of_day1(-4231)
