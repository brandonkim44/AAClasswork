#Phase I: Naive Solution
require "byebug"
def windowed_max_range(array, window_size)
    current_max_range = 0
    (0...array.length).each do |i|
        if window_size <= array[i..-1].length
            window = array[i...i+window_size]
            max_range = window.max - window.min
            current_max_range = max_range if max_range > current_max_range
        end
    end
    current_max_range
end

#test cases:

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5)# == 6 # 3, 2, 5, 4, 8

# What is time complexity? O(n^3)

#Phase II: MyQueue



