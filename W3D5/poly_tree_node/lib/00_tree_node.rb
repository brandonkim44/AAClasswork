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
        "<#PolyTreeNode:#{self.object_id}"
    end
end




class Searchable
    def dfs
        
    end
end