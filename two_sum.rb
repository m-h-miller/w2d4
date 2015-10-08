# O(n^2)
def bad_two_sum?(arr, target)
  i = 0
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

#first idea, still O(n^2) but better runtimes
def okay_two_sum_obsolete?(arr, target)
  arr.sort!

  (0...arr.length-1).each do |i|
    (i...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
      next if arr[i] + arr[j] > target
    end
  end
  false
end

#second idea O(n)
def okay_two_sum?(arr, target)
  arr.sort!
  i = 0
  j = arr.length - 1
  until i == j

    sum = arr[i] + arr[j]
    return true if sum == target

    if sum < target
      i += 1
    elsif sum > target
      j -= 1
    end

  end

  false
end

def pair_sum?(arr, target)
  num_hash = Hash.new(0)

  arr.each do |el|
    return true if num_hash[target - el] > 0
    num_hash[el] += 1
  end
  false
end


arr = (0..39999999).to_a.shuffle

# a = Time.now
# bad_two_sum?(arr, 999)
# b = Time.now
# p b - a

# a1 = Time.now
# okay_two_sum_obsolete?(arr, 999)
# b1 = Time.now
# p b1 - a1

a2 = Time.now
okay_two_sum?(arr, 999)
b2 = Time.now
p b2 - a2

a3 = Time.now
pair_sum?(arr, 999)
b3 = Time.now
p b3 - a3
