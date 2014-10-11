require './lib'

puts "Welcome to Warsaw. Let's party.".black.on_white

test_name = ARGV[0]
require "./suites/#{test_name}"

