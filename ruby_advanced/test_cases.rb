test cases

####TEST CASES######

a = [1,3,2,4,5,7,10]

a.my_each { |i| puts " #{i} squared = #{i ** 2} "}
puts "\n"
a.my_each_with_index { |val, i| puts " value:#{val}, index: #{i} "}
puts"\n"
puts "Even numbers in array: #{a.my_select { |num| num % 2 == 0}}"
puts"\n"

puts "Test Cases for .all?:"
puts a.my_all? { |num| num.is_a? Integer}
puts a.my_all? { |num| num % 2 == 0}
puts a.my_all? { |num| num > 5}
puts a.my_all? { |num| num > 0}
puts "\n"

puts "Test Cases for .any?:"
puts a.my_any? { |num| num.is_a? Integer}
puts a.my_any? { |num| num % 2 == 0}
puts a.my_any? { |num| num > 5}
puts a.my_any? { |num| num > 20}
puts [0,1,2,3].my_any?
puts [false, nil, false].my_any?
puts "\n"

p a.my_each
p a.my_each_with_index
p a.my_select
p a.my_all?
p [1,2,false].my_all?
puts "\n"

puts "Test Cases for .none?:"
puts a.my_none? { |num| num.is_a? Integer}
puts a.my_none? { |num| num % 2 == 0}
puts a.my_none? { |num| num > 5}
puts a.my_none? { |num| num > 20}
puts [0,1,2,3].my_none?
puts [false, nil, false].my_none?
puts "\n"

puts "Test Cases for .my_count:"


puts a.my_count { |num| num.is_a? Integer}
puts a.my_count { |num| num % 2 == 0}
puts a.my_count { |num| num > 5}
puts a.my_count { |num| num > 20}
puts [0,1,2,3,4].my_count
puts [false, nil, false].my_count(nil)

puts "Test Cases for .my_map:"
times_two = Proc.new { |num| num * 2}

puts "original array: #{a}"
p a.my_map(times_two)
#p a.my_map { |num| num * -1}
#p a.my_map { |num| num / 2.0}
#p a.my_map { |num| num - 1}
#p a.my_map



puts "Test Cases for .my_inject:"
puts [5,10,15].my_inject(0) {|sum, i| sum + i}
puts [5,10,15].my_inject {|sum, i| sum + i}
puts [5,10,15].my_inject(1) {|product, i| product * i}
puts [5,10,15].my_inject(-1) {|product, i| product * i}
puts "\n"


puts "Test Cases for multiply_els"
puts multiply_els([2,1,6,3,-1])