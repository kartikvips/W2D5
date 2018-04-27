def first_anagram(string1,string2)

  perm = perms(string1).map(&:join)
  perm.include?(string2)

end

def perms(string)
  string.chars.permutation.to_a
end

puts "Permutations- First Anagram"
time = Time.now
puts first_anagram("gizmo","sally")
puts Time.now - time
time = Time.now
puts first_anagram("elvis","lives")
puts Time.now - time


def second_anagram?(str1, str2)
  str_one = str1.dup.chars
  str_two = str2.dup.chars

  str_one.each_with_index do |el1, idx1|
    str_two.each_with_index do |el2, idx2|

      if el1 == el2
        str1.delete!(el1)
        str2.delete!(el2)
      end

    end
  end
  str1.empty? && str2.empty?
end

puts "Nested - Second Anagram"
time = Time.now
puts second_anagram?("gizmo","sally")
puts Time.now - time
time = Time.now
puts second_anagram?("elvis","lives")
puts Time.now - time


def third_anagram?(str1,str2)

  str1.chars.sort.join == str2.chars.sort.join

end

puts ".sort - Second Anagram"
time = Time.now
puts third_anagram?("gizmo","sally")
puts Time.now - time
time = Time.now
puts third_anagram?("elvis","lives")
puts Time.now - time


def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  idx = 0
  while idx<str1.length
    hash1[str1[idx]] += 1
    idx+=1
  end

  idx=0
  while idx<str2.length
    hash2[str2[idx]] += 1
    idx+=1
  end

  anagram = true

  hash1.keys.each do |k,v|
    anagram = false unless hash1[k] == hash2[k]
  end

  anagram

end

puts "Hash - Fourth Anagram"
time = Time.now
puts fourth_anagram?("gizmo","sally")
puts Time.now - time
time = Time.now
puts fourth_anagram?("elvis","lives")
puts Time.now - time















#
