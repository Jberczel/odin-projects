

def merge_sort(a)
  return a if a.length == 1
  half = a.length / 2
  l = merge_sort(a[0..half - 1])
  r = merge_sort(a[half..-1] )
  merge(l, r)
end


def merge(l, r)
  i, j = 0, 0
  m = Array.new
  len_l, len_r = l.length, r.length

  while i < len_l || j < len_r
    if i < len_l && j < len_r
      if l[i] <= r[j]
        m << l[i]
        i += 1
      else
        m << r[j]
        j += 1
      end   
    elsif i < len_l
      m << l[i]
      i += 1
    elsif j < len_r
      m << r[j]
      j+= 1
    end
  end
  m
end

p merge_sort([2,100,4,2,22,0,55,-32,5,44])
   