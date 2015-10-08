def all_anagrams(str)
  return [str] if str.length == 1

  results = []
  # first_letter = str[0]

  (0...str.length).each do |i|
    letter = str[i]
    all_anagrams(str[0...i] + str[i + 1...str.length]).each do |anagram|
    results << letter + anagram
    end
  end
  results
end

def first_anagram?(str1, str2)
  anagrams = all_anagrams(str1)
  anagrams.include?(str2)
end

def second_anagram?(str1, str2)
  until str1.empty?
    match = false
    (0...str2.length).each do |i|
      if str1[0] == str2[i]
        str1.slice!(0)
        str2.slice!(i)
        match = true
      end
    end
    return false if match == false
  end
  str1 == str2
end

def third_anagram?(str1, str2)
  str1.sort == str2.sort

end

def fourth_anagram?(str1, str2)
  freq = Hash.new(0)

  str1.each_char do |char|
    freq[char] += 1
  end

  str2.each_char do |char|
    freq[char] -= 1
  end

  freq.all? {|k, v| v == 0 }
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("ilevs", "lives")    #=> true
