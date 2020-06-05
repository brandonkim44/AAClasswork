require "peg"

describe Peg do
  subject(:peg) { Peg.new(1) }
  describe "#initialize" do
    it "should be a peg" do
      expect(peg).to be_a(Peg)
    end
    it "should have a @stack variable set to an array" do
      stack = peg.instance_variable_get(:@stack)
      expect(stack).to eq([])
    end
    it "should have an @order variable" do
      order = peg.instance_variable_get(:@order)
      expect(order).to eq(1)
    end
  end

  describe "#stack" do
    it "should return @stack" do
      expect(peg.stack).to eq([])
    end
  end
  
  describe "#order" do
    it "should return @order" do 
      expect(peg.order).to eq(1)
    end
  end

  describe "#add_disk" do
    it "should take in an integer" do
      expect { peg.add_disk(1) }.to_not raise_error
    end
    it "should raise type error when argument is not integer" do
      expect { peg.add_disk("string") }.to raise_error(TypeError)
    end
    it "should add a disk to the end of the stack" do
      expect(peg.add_disk(1)).to eq([1])
    end
  end

  describe "#valid_move?" do
    it "should take in a last peg"
    it "should return a boolean" do
      expect()
    end
  end

  describe "#remove_disk" do
    it "should remove a disk at the end of the stack"
  end

end