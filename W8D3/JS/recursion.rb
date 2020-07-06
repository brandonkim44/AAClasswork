def range(start_n, end_n)
    return [] if start_n == end_n
    range(start_n, end_n-1) + [end_n-1]
end 

# print range(2, 6)

# def dup_array(array)
#     new_arr = []
#     array.dup
# end

