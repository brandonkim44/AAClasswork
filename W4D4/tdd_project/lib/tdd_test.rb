class Array
  def my_uniq
    hash = Hash.new
    self.each { |ele| hash[ele] = true }
    hash.keys
  end

  def two_sum
    new_arr = []
    (0...self.length).each do |i|
      (0...self.length).each do |j|
        new_arr << [i, j] if i < j && self[i] + self[j] == 0
      end
    end
    new_arr
  end

  def my_transpose
    raise TypeError.new("Must be 2-D Array") unless self[0].is_a?(Array)
    (0...self.length).map do |i|
      self.map { |subarr| subarr[i] }
    end
  end

end

def stock_picker(array)
  raise ArgumentError unless array.all? { |ele| ele.is_a?(Float)}
  hash = Hash.new
  (0...array.length).each do |i|
      (0...array.length).each do |j|
        hash[[i,j]] = array[j] - array[i] if i < j
      end
    end
    new_hash = hash.sort_by { |k, v| v }
    new_hash.last.first
end