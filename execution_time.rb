class Array
  # O(n^2)
  def my_min1
    each { |el| return el if all? { |other_el| other_el >= el } }
  end

  # O(n)
  def my_min2
    min = nil
    each do |el|
      if min.nil?
        min = el
      else
        min = el if el < min
      end
    end

    min
  end


  # O(n^2)
  def sub_sum1
    sub_arrs = []

    #O(n^2)
    (0...length).each do |i|
      (i...length).each do |j|
        sub_arrs << self[i..j]
      end
    end

    #O(n^3)
    # sub_arrs.map { |sub_arr| sub_arr.inject(:+) }.max

    # O(n^2)
    max_sum = 0
    sub_arrs.each do |sub_arr|
      new_sum = sub_arr.inject(:+)
      max_sum =  new_sum if new_sum > max_sum
    end
    max_sum

  end

  # O(n)
  def sub_sum2
    max_sum = 0
    new_sum = 0

    each do |el|

      new_sum += el

      max_sum = new_sum if new_sum > max_sum

      new_sum = 0 if new_sum < 0

      # if el >= 0
      #   new_sum += el
      # else
      #   if new_sum + el > 0
      #     old_sum = [old_sum, new_sum].max
      #     new_sum += el
      #   else
      #     old_sum = [old_sum, new_sum].max
      #     new_sum = 0
      #   end
      # end
    end

    max_sum
  end

end
