require "byebug"
class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        return if self.parent == parent_node
        
        old_parent = self.parent
        if old_parent #reassignment
            # freeing self node from old parent before reassigning new parent as self node's parent
            old_parent.children.delete(self)
        end

        # node doesn't have parent or old_parent was deleted
        @parent = parent_node
        # want node (self) to be root node
        parent_node.children << self unless parent_node.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent.nil?
            raise "Node is not a child!"
        else
            child_node.parent = nil
        end
    end
    
    def inspect
        "PolyTreeNode - value: #{value} - parent: #{self.parent} - children: #{self.children}\n"
    end


    def dfs(target) #self = 4
        return self if self.value == target
        # return nil if self.children.empty?

        self.children.each do |child_node|  # 4.children.each do |child_node|
            if !self.children.empty?
                child_node.dfs(target) # => nil
            end
        end
        nil
    end


    
# end

    #         1
    #      /     \
    #     2       3
    #   /  \     /  \
    #  4   5    6    7 






# module Searchable
# #   I wrote this as a mixin in case I wanted to later write another
# #   TreeNode class (e.g., BinaryTreeNode). All I need is `#children` and
# #   `#value` for `Searchable` to work.

#   def dfs(target = nil, &prc)
#     raise "Need a proc or target" if [target, prc].none?
#     prc ||= Proc.new { |node| node.value == target }

#     return self if prc.call(self)

#     children.each do |child|
#       result = child.dfs(&prc)
#       return result unless result.nil?
#     end

#     nil
#   end


#     #         1
#     #      /     \
#     #     2       3
#     #   /  \     /  \
#     #  4   5    6    7 

    
#   def bfs(target = nil, &prc) #3
#     raise "Need a proc or target" if [target, prc].none?
#     prc ||= Proc.new { |node| node.value == target }

#     nodes = [self] 
#     until nodes.empty?
#       node = nodes.shift

#       return node if prc.call(node)
#       nodes.concat(node.children)
#     end

#     nil
#   end

#   def count
#     1 + children.map(&:count).inject(:+)
#   end
# end

# class PolyTreeNode
#   include Searchable

#   attr_accessor :value
#   attr_reader :parent

#   def initialize(value = nil)
#     @value, @parent, @children = value, nil, []
#   end

#   def children
#     # We dup to avoid someone inadvertently trying to modify our
#     # children directly through the children array. Note that
#     # `parent=` works hard to make sure children/parent always match
#     # up. We don't trust our users to do this.
#     @children.dup
#   end

#   def parent=(parent)
#     return if self.parent == parent

#     # First, detach from current parent.
#     if self.parent
#       self.parent._children.delete(self)
#     end

#     # No new parent to add this to.
#     @parent = parent
#     self.parent._children << self unless self.parent.nil?

#     self
#   end

#   def add_child(child)
#     # Just reset the child's parent to us!
#     child.parent = self
#   end

#   def remove_child(child)
#     # Thanks for doing all the work, `parent=`!
#     if child && !self.children.include?(child)
#       raise "Tried to remove node that isn't a child"
#     end

#     child.parent = nil
#   end

#   protected
  
#   # Protected method to give a node direct access to another node's
#   # children.
#   def _children
#     @children
#   end
# end

# # a = PolyTreeNode.new(1)
# # b = PolyTreeNode.new(2)
# # c = PolyTreeNode.new(3)
# # d = PolyTreeNode.new(4)
# # e = PolyTreeNode.new(5)
# # f = PolyTreeNode.new(6)
# # g = PolyTreeNode.new(7)

# # a.add_child(b)
# # a.add_child(c)
# # b.add_child(d)
# # b.add_child(e)
# # c.add_child(f)
# # c.add_child(g)


# # p a.count