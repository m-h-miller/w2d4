def bad_two_sum?(arr, target)
  i=0
  while i < arr.length - 2
    j = 1
    while j < arr.length - 1
      return true if arr[i] + arr[j] == target
      j += 1
    end
    i+= 1
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
      next if arr[i] + arr[j] > target
    end
  end
  false
end

p Time.now
p bad_two_sum?([1,2,3,4,5,6,7,8,9], 99)
p okay_two_sum?([1,2,3,4,5,6,7,8,9], 99)
p Time.now
