#!/usr/bin/ruby
parens = File.open(ARGV[0], 'r').read

count = 0
i = 0
parens.each_char do |c|
  i += 1
  count += 1 if c == '('
  count -= 1 if c == ')'
  puts(i) && exit! if count < 0
end
