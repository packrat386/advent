#!/usr/bin/ruby

def change(str, x, y)
  return 1 if str == "turn on"
  return -1 if str == "turn off"
  return 2 if str == "toggle"
  raise "wtf"
end


lights = []
1000.times do
  temp = []
  1000.times do
    temp << 0
  end
  lights << temp
end

lines = File.open(ARGV[0], 'r').read
lines.each_line do |line|
  c = /(.*)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/.match(line)
  (c[2].to_i .. c[4].to_i).each do |x|
    (c[3].to_i .. c[5].to_i).each do |y|
      lights[x][y] += change(c[1], x, y)
      lights[x][y] = 0 if lights[x][y] < 0
    end
  end
end

puts lights.flatten.reduce(:+)
