
# takes an array and returns a sorted array using bubble sort algorithm
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

# bubble sort that also takes a block
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
