# my_min
# Given a list of integers find the smallest number in the list.
require "byebug"
# Phase I
# First, write a function that compares each element to every other element of the list. 
# Return the element if all other elements in the array are larger.

    def my_min(array)
        min = 0
        array.each_with_index do |num1, idx1|
            array.each_with_index do |num2, idx2|
                min = num2 if idx2 > idx1 && num2 < num1
            end
        end
        min
    end

    # Example:

    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # p my_min(list)  # =>  -5

# What is the time complexity for this function?
# O(n^2)


# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity? O(n)

def my_min_faster(array)
    end_min = 0
    array.inject do |min, num| 
        # debugger
        if num < min
            min = num
        else
            min = min
        end
        end_min = min
    end
    end_min
end

# p my_min_faster(list)

# Largest Contiguous Sub-sum
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. 
# Find the sums of all contiguous sub-arrays and return the max.

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. 
# First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# O(n^3)

def largest_contiguous_subsum(array)
    sum = 0
    sub_arrs = []
    (0...array.length).each do |idx1|
        (idx1...array.length).each do |idx2|
            sub_arrs << array[idx1..idx2].sum
        end
    end
    sub_arrs.max
end

# Example:

    # list = [5, 3, -7]
    # p largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

# Example 2:

    # list = [2, 3, -6, 7, -6, 7]
    # p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# Example 3:

    # list = [-5, -1, -3]
    # p largest_contiguous_subsum(list) # => -1 (from [-1])


# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. 
# Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. 
# To accomplish this efficient space complexity, consider using two variables. 
# One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.


def largest_contiguous_subsum_2(array)
    largest_sum = 0
    current_sum = largest_sum
    array.each do |ele|
        
    end
end

# Example 1:

    # list = [2, 3, -6, 7, -6, 7]
    # p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])

# Example 2:

    # list = [-5, -1, -3]
    # p largest_contiguous_subsum_2(list) # => -1 (from [-1])