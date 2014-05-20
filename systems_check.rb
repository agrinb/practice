scores = [75, 100, 85, 65, 84, 87, 95]

def max_score(array)
  max = array[0]
  array.each do |i|
    if max < i
      max = i
    end
  end
  max
end


def min_score(array)
  min = array[0]
  array.each do |i|
    if min > i
      min = i
    end
  end
  min
end


def avg_score(array)
  product = 0
  array.each do |i|
    product += i
  end
  product / array.length

end


puts max_score(scores)
puts min_score(scores)
puts avg_score(scores)

