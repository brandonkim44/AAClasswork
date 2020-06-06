# Our goal today is to write a method that determines if two given words are anagrams. 
# This means that the letters in one word can be rearranged to form the other word. 
# For example:
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true


# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. 
# Check if the second string is one of these.

def first_anagram(string, test_string)
    anagrams = []
    string_arr = string.split("")
    i = 0
    string_arr.permutation.to_a.each do |anagram|
        anagrams << anagram.join("")
    end
    anagrams.include?(test_string) ? true : false
end

# Hints:

# string = "cat"
# test_string = "tac"
# p first_anagram(string, test_string)

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings? 
# O(n!), as string input size increase,so does the "n"th value which means run time scales up very quickly for each +1 input size



# Phase II:
# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. 
# The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

def second_anagram(string, test_string)
    
end

# string = "hello"
# test_string = "llohe"
# p second_anagram(string, test_string)

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??



# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.