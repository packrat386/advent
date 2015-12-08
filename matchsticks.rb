#!/usr/bin/ruby

raw = 0
parsed = 0
encoded = 0
File.readlines(ARGV[0]).each do |l|
  l.chomp!
  puts "#{l} -> #{l.inspect}"
  raw += l.size
  parsed += eval(l).size
  encoded += l.inspect.size
end

puts "RAW: #{raw}"
puts "PARSED: #{parsed}"
puts "ENCODEDL #{encoded}"
