def swap(arr, i, j)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end

def bubble_sort_by(to_sort)
  k_most_sorted = 0
  max_index = to_sort.length - 1

  for i in (0..max_index)
    swap_performed = false

    for j in (0..max_index - k_most_sorted - 1)
      comparison = yield(to_sort[j], to_sort[j + 1])
      if comparison > 0
        swap(to_sort, j, j + 1)
        swap_performed = true
      end
    end

    if swap_performed
      k_most_sorted += 1
    else
      return to_sort
    end
  end
  to_sort
end

def bubble_sort(to_sort)
  bubble_sort_by(to_sort) do |left, right|
    left <=> right
  end
end

print bubble_sort([4, 2, 6, 1, 8, 1])

to_sort = ["hi", "hello", "hey"]
bubble_sort_by(to_sort) do |left, right|
  left.length - right.length
end
print to_sort
