#!/usr/bin/ruby


def foo(endpoint)
  return $memo[endpoint] if $memo[endpoint]
  $memo[endpoint] = find(endpoint)
end

def find(endpoint)
  return endpoint.to_i if /^\d+$/.match(endpoint)
  ops = $gates[endpoint].split(' ')
  return foo(ops[0]) if ops.size == 1
  return ~foo(ops[1]) if ops.size == 2

  case ops[1]
  when 'LSHIFT'
    return foo(ops[0]) << foo(ops[2])
  when 'RSHIFT'
    return foo(ops[0]) >> foo(ops[2])
  when 'AND'
    return foo(ops[0]) & foo(ops[2])
  when 'OR'
    return foo(ops[0]) | foo(ops[2])
  end
end

$gates = {}
$memo = {}

File.readlines(ARGV[0]).each do |l|
  input, output = l.chomp.split(' -> ')
  $gates[output] = input
end

val = foo(ARGV[1])
puts "First run a: #{val}"
$memo = {}
$gates[ARGV[2]] = val.to_s
puts "Second run a: #{foo(ARGV[1])}"
