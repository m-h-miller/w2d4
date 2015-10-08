class Integer
  def fact
    (1..self).inject(:*) || 1
  end
end

def rand_permutation(str)
  arr = str.chars
  counter = Hash.new(0)
  arr.each { |el| counter[el] += 1}

  k = counter.values.select { |value| value > 1}.length
  n = arr.length

  permutations = []

  if k == 0
    perm_num = n.fact
  else
    perm_num = n.fact / (counter.values.map {|value| value.fact}.inject(:*))
  end


  until permutations.length == perm_num
    current = arr.shuffle.join
    permutations << current unless permutations.include?(current)
  end

  permutations
end

def rec_permutation(arr)
  return arr if arr.length < 2

  arr.map {|el| rec_permutation(arr-[el]).map {|el2| [el, el2]}}
end

def permutate(arr)
  rec_permutation(arr).flatten.each_slice(arr.length).map(&:join)
end

def rec_perm2(arr)
  return [arr.join, arr.reverse.join] if arr.length == 2

  arr_dup = arr.dup
  result = []
  arr.each.with_index do |el, idx|
    arr_dup.delete_at(idx)
    result << (rec_perm2(arr_dup).map { |el2| "#{el}#{el2}"})
  end

  result.flatten
end
