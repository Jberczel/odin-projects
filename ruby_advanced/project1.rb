def bubble_sort(list)
  loop do
    i, swap = 0, 0
    while i < list.length - 1
      if list[i + 1] < list[i]
        list[i], list[i + 1] = list[i + 1], list[i]
        swap += 1
      end
      i += 1
    end
    break if swap == 0
  end
  list
end

def bubble_sort_by(list)
  loop do
    i, swap = 0, 0
    while i < list.length - 1
      if yield(list[i], list[i + 1]) > 0
        list[i], list[i + 1] = list[i + 1], list[i]
        swap += 1
      end
      i += 1
    end
    break if swap == 0
  end
  list
end

#### TEST CASES #####

my_array = [5, 1, 4, 2, 8]
s_array = %w(hi hello howdy how helium hey)

puts "Actual: #{bubble_sort(my_array)}"
puts "Actual: #{bubble_sort(s_array)}"
puts "Actual: #{bubble_sort([4, 3, 78, 2, 0, 2])}"

# sorts descending order using block
puts "Actual: #{bubble_sort_by(s_array) { |left, right| right <=> left }}"
puts "Actual: #{bubble_sort_by(my_array) { |num1, num2| num2 <=> num1 }}"
puts "Actual: #{bubble_sort_by([4 , 3, 78, 2, 0, 2]) { |num1, num2| num2 <=> num1 }}"
