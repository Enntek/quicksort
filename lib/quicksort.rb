# Write a method using recursion for quicksort

require 'pry-byebug'
def quicksort(array)
  return array if array.size <= 1
  
  pivot = array.shift
  less_than_arr = []
  greater_than_arr = []
  
  until array.empty?
    if array.first < pivot
      less_than_arr << array.shift
    else
      greater_than_arr << array.shift
    end
  end

  return quicksort(less_than_arr) + [pivot] + quicksort(greater_than_arr)
end

arr = [3, 4, 2, 1, 5, 0, 10, 9, 7, 8, 6]
# arr = [4, 2, 3, 0]
p quicksort(arr)

n = 500000
require 'benchmark'
Benchmark.bm do |x|
  x.report { n.times do   ; merge_sort(arr); end }
  x.report { n.times do   ; quicksort(arr); end }
  x.report { n.times do   ; arr.sort; end }
  x.report { n.times do   ; arr.sort!; end }
end