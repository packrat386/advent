#!/usr/bin/ruby

require 'digest'
base = ARGV[0]
i = 1
md5 = Digest::MD5.new
loop do
  digest = md5.hexdigest(base + i.to_s)
  if /^000000.*$/.match(digest)
    puts "#{i}: #{digest}"
    exit!
  end
  i += 1
end
