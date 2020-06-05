require 'tdd_test'

describe Array do

  describe "#my_uniq" do
    subject(:array) {[1, 1, 2, 2, 3, 3]}
    it "should take in an array" do
      expect { array.my_uniq }.to_not raise_error
    end
    it "should return a new array with no duplicate elements" do
      array2 = [4, 4, 5, 6]
      array3 = ["dog", "dog", "cat"]
      expect(array.my_uniq).to eq([1,2,3])
      expect(array2.my_uniq).to eq([4, 5, 6])
      expect(array3.my_uniq).to eq(["dog", "cat"])
    end
  end

  describe "#two_sum" do
    subject(:array) { [-1, 0, 2, -2, 1] }
    it "should take in an array" do
      expect { array.my_uniq }.to_not raise_error
    end
    it "should return a new array" do
      expect(array.two_sum).to be_a(Array)
    end
    it "should add two elements and check sum equals zero" do
      new_arr = array.two_sum
      sub_arr1 = new_arr[0]; sub_arr2 = new_arr[1]
      sum1 = array[sub_arr1[0]] + array[sub_arr1[1]]
      sum2 = array[sub_arr2[0]] + array[sub_arr2[1]]
      expect(sum1).to eq(0)
      expect(sum2).to eq(0)
    end
    it "should make each pair have the smaller index before the larger" do
      new_arr = array.two_sum
      sub_arr1 = new_arr[0]; sub_arr2 = new_arr[1]
      expect(sub_arr1).to eq([0,4])
      expect(sub_arr2).to eq([2,3])
      expect(new_arr).to eq([[0,4],[2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
    it "should take a 2D array" do
      expect { array.my_transpose }.to_not raise_error
      expect(array[0]).to be_a(Array)
    end
    it "should raise a type error when input is not a 2D array" do
      array2 = [1, 2, 3]
      expect { array2.my_transpose }.to raise_error(TypeError)
    end
    it "should return a new 2D array" do
      new_arr = array.my_transpose
      sub_arr = new_arr[0]
      expect(sub_arr).to be_a(Array)
      expect(array).to_not eql(new_arr)
    end
    it "should make each subarray contain elements of same index in original array" do
      new_arr = array.my_transpose
      sub_arr1 = new_arr[0]; sub_arr2 = new_arr[1]; sub_arr3 = new_arr[2]
      expect(sub_arr1).to eq([0, 3, 6])
      expect(sub_arr2).to eq([1, 4, 7])
      expect(sub_arr3).to eq([2, 5, 8])
    end
  end

end

#---

describe "#stock_picker" do
    subject(:stock_prices) { [2.50, 10.00, 5.50, 21.75, 2.50, 15.25] }
    it "should take in an array of floats as an argument" do
      sum = stock_prices.sum
      expect(sum).to be_a(Float)
      expect { stock_picker(stock_prices) }.to_not raise_error
    end
    it "should raise an argument error if not all elements in input array are floats" do
      array1 = [1,2,3,4,5]
      array2 = %w(dog cat)
      expect { stock_picker(array1) }.to raise_error(ArgumentError)
      expect { stock_picker(array2) }.to raise_error(ArgumentError)
    end
    it "should return an array" do
      best_days = stock_picker(stock_prices)
      expect(best_days).to be_a(Array)
    end
    it "should an array where the first element is less than the second element" do
      best_days = stock_picker(stock_prices)
      expect(best_days).to be_a(Array)
      expect(best_days[0]).to be < best_days[1]
    end
    it "should return the max difference between an ele at a later idx and earlier idx" do
      expect(stock_picker(stock_prices)).to eq([0,3])
    end
end