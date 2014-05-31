## Project Recursion

###Warmup: Fibonnacci

Write iterative and recursive methods.

###Merge-Sort

Write Merge-sort sorting method.


After writing the merge-sort method, I wanted to compare to other solutions. I found these two implementation, which use some neat ruby methods I haven't used before.

From [Wikipedia](http://en.wikibooks.org/wiki/Algorithm_Implementation/Sorting/Merge_sort#Python):

```
def mergesort(list)
  return list if list.size <= 1
  mid = list.size / 2
  left  = list[0, mid]
  right = list[mid, list.size-mid]
  merge(mergesort(left), mergesort(right))
end
 
def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
end
```

And a [gist](https://gist.github.com/nkpart/1286207) from github:

```
 
def merge_sort(a)
    return a if a.size <= 1
    l, r = split_array(a)
    result = combine(merge_sort(l), merge_sort(r))
end
 
def split_array a
  mid = (a.size / 2).round
  [a.take(mid), a.drop(mid)]
end
 
def combine a, b
  return b.empty? ? a : b if a.empty? || b.empty?
  smallest = a.first <= b.first ? a.shift : b.shift
  combine(a, b).unshift(smallest)
end
 
a = [6,23,53,1,2,5,62,61,33,21,14,6,23].shuffle
p merge_sort(a) # p x <=> puts x.inspect
 ```