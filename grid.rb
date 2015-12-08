#!/usr/bin/ruby

class Santa
  def initialize
    @x = 0
    @y = 0
  end

  def point
    [@x,@y]
  end

  def move(c)
    @x += 1 if c == '>'
    @x -= 1 if c == '<'
    @y += 1 if c == '^'
    @y -= 1 if c == 'v'
    point
  end
end

grid = File.open(ARGV[0], 'r').read
santa = Santa.new
robo = Santa.new
h = Hash.new { 0 }
h[santa.point] += 1
h[robo.point] += 1

grid.each_char.with_index do |c, i|
  if (i % 2) == 0
    h[santa.move(c)] += 1
  else
    h[robo.move(c)] += 1
  end
end

puts santa.point
puts robo.point
puts h
puts h.count
