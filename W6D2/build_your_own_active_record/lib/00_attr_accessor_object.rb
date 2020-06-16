class AttrAccessorObject
  def self.my_attr_accessor(*names) #when my_attr_accessor is called, it will pass in an array of instance variables, e.g. :x, :y
    instance_variable_names = names #assigns array of args to variable
      instance_variable_names.each do |instance_variable| #iterate through names of instance variables
        define_method("#{instance_variable}") do  #define method for name of the instance var & pass behavior into method
          instance_variable_get("@#{instance_variable}") #returns the instance variable
        end
        define_method("#{instance_variable}=") do |new_value| #this method should be a setter, and takes an arg in parentheses, 
        # which is where new value goes in
        # iterate through names of instance variables and assign the 2nd arg to instance variable
          instance_variable_set("@#{instance_variable}", new_value) #this Object class method should assign new_Value to instance var
        end
      end
  end
end

# variable = AttrAccessorObject.new
# variable.my_attr_accessor([:x, :y])
# variable.x -> x.value
# variable.x=(y.value)

