class MaxIntSet
attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
    # { 0, 2, 3 } num will == to idx in arr 
    # [t, f, t, t] index to the set
  end

  def insert(num)
    validate!(num)
    unless include?(num) # unless include?(1) => unless false 
    @store[num] = true 
    end
  end

  def remove(num)
    validate!(num)
      @store[num] = false  
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

  def validate!(num)
    raise 'Out of bounds' if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    # {1, 2, 4, 5, 10, 15, 20, (100numbers in set)}
    # [ [20], [1], [2], [4] ....etc.20] 
    # all of these classes are implementations of a set ADT, 
    # we're just writing different data structures to organize the data, and 
    # we're slowly working our day up to writing the most efficient managing data
  end

  def insert(num)
    idx = num % num_buckets
    unless include?(num)
      @store[ idx ] << num 
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store 

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % num_buckets
    unless include?(num)
      @store[ idx ] << num 
      self.count += 1 
      resize! if self.count >= num_buckets
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      self.count -= 1 
    end 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = self.store
    self.store = Array.new(num_buckets * 2) {Array.new}
    self.count = 0
    old_store.flatten.each do |ele|
      self.insert(ele)
    end
  end
end
