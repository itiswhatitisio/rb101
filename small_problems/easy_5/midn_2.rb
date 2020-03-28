
def after_midnight(time)
  splitted = time.split(':')
  arr = splitted.map(&:to_i)
  result = arr[0] * 60 + arr[1]
  result = 0 if result == 1440
  result
end

def before_midnight(time)
  splitted = time.split(':')
  arr = splitted.map(&:to_i)
  result = 1440 - (arr[0] * 60 + arr[1])
  result = 0 if result == 1440
  result
end

after_midnight('00:00').zero?
before_midnight('00:00').zero?
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00').zero?
before_midnight('24:00').zero?

# Further exploration

require 'time'
require 'date'

def after_midnight1(time)
  date = DateTime.parse(time)
  minutes = date.hour * 60 + date.min
  minutes
end

def before_midnight1(time)
  date = DateTime.parse(time)
  minutes = 1440 - (date.hour * 60 + date.min)
  minutes = 0 if minutes == 1440
  minutes
end

p after_midnight1('00:00').zero?
p before_midnight1('00:00').zero?
p after_midnight1('12:34') == 754
p before_midnight1('12:34') == 686
p after_midnight1('24:00').zero?
p before_midnight1('24:00').zero?
