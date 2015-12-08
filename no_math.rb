#!/usr/bin/ruby

def fudged_area(length, width, height)
  areas = [length*width, width*height, length*height]
  areas.map { |a| 2*a }.reduce(&:+) + areas.min
end

def volume(l, w, h)
  l * w * h
end

def min_perimeter(l, w, h)
  sides = [ l, w, h ]
  sides.sort!
  puts sides
  (sides[0] + sides[1]) * 2
end

present = File.open(ARGV[0], 'r').read
paper = 0
ribbon = 0
present.each_line do |line|
  sides = /(\d+)x(\d+)x(\d+)/.match(line)
  paper += fudged_area(sides[1].to_i, sides[2].to_i, sides[3].to_i)
  ribbon += min_perimeter(sides[1].to_i, sides[2].to_i, sides[3].to_i)
  ribbon += volume(sides[1].to_i, sides[2].to_i, sides[3].to_i)
end

puts "paper: #{paper}"
puts "ribbon: #{ribbon}"
