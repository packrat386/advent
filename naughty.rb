#!/usr/bin/ruby

strings = File.open(ARGV[0], 'r').read
nice = 0
strings.each_line do |str|
  next unless /(.).\1/.match(str)
  next unless /(..).*\1/.match(str)
  nice += 1
end

puts nice
