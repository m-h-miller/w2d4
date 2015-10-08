
def first_anagram? (str1, str2)
  anagrams = []
  letters = str1.chars

  rand_permutation(str1).include?(str2)
end

def second_anagram?(str1, str2)
  str_a = str1.chars
  str_b = str2.chars
  str_c = str_a.dup
  str_d = str_b.dup

  str_a.each_with_index do |ltr, idx1|
    str_b.each_with_index do |b_ltr, idx2|

      if ltr == b_ltr
        str_c.delete_at(idx1)
        str_d.delete_at(idx2)
      end
    end
  end

  str_d.empty? && str_c.empty?
end



def third_anagram? (str1, str2)

  str1.chars.sort == str2.chars.sort
end


#O(n)
def fourth_anagram? (str1, str2)
  letters = Hash.new(0)
  letters2 = Hash.new(0)

  str1.chars.each do |char|
    letters[char] += 1
  end

  str2.chars.each do |char|
    letters2[char] += 1
  end

  letters == letters2
end


def fifth_anagram? (str1, str2)
  letters = Hash.new(0)
  str3 = str1 + str2

  str3.chars.each do |char|
    letters[char] += 1
  end

  letts = letters.values

  letts.each do |l|
    return false if l % 2 != 0
  end

  true
end

p first_anagram?("devil", "lived")


# HELPER METHODS #
