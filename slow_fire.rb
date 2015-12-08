#!/usr/bin/ruby

class Light
  attr_accessor :on

  def initialize(x, y)
    @x = x
    @y = y
    @on = false
  end

  def turn_on
    @on = true
  end

  def turn_off
    @on = false
  end

  def toggle
    @on = !@on
  end

  def in(x0, y0, x1, y1)
    (@x >= x0) && (@x <= x1) && (@y >= y0) && (@y <= y1)
  end
end

def sym_for(str)
  puts str
  return :turn_on if str == "turn on"
  return :turn_off if str == "turn off"
  return :toggle if str == "toggle"
  raise "wtf"
end

lights = []

(0..999).each do |x|
  (0..999).each do |y|
    lights << Light.new(x, y)
  end
end

lines = File.open(ARGV[0], 'r').read
lines.each_line do |line|
  c = /(.*)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/.match(line)
  puts c
  sym = sym_for(c[1])
  lights.each { |l| l.send(sym) if l.in(c[2].to_i, c[3].to_i, c[4].to_i, c[5].to_i) }
end

puts lights.find_all{ |l| l.on }.count
