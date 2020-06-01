require_relative '00_tree_node'
# require "byebug"
class KnightPathFinder
    attr_accessor :considered_positions
    attr_accessor :root_node

    POSSIBLE_MOVES = [
        [1, 2],
        [-1, 2],
        [1, -2],
        [-1, -2],
        [-2, -1],
        [-2, 1],
        [2, -1],
        [2, 1]
    ]
    
    def self.valid_moves(pos) #min row = 0 , min col = 0, max row = 7, max col = 7
        valid_moves = []
        row, col = pos
        POSSIBLE_MOVES.each do |move|
            new_row, new_col = move
            if ((row + new_row) >= 0 && (row + new_row) <= 7) && ((col + new_col) >= 0 && (col + new_col) <= 7)
                valid_moves << [row + new_row, col + new_col]
            end
        end
        valid_moves
    end
    
    def initialize(start_pos)
        self.root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def new_move_positions(pos) #all possible valid and nonconsidered moves
        pos_positions = KnightPathFinder.valid_moves(pos).reject { |valid_pos| @considered_positions.include?(valid_pos) }
        @considered_positions.concat(pos_positions)
        pos_positions
    end

    def build_move_tree
        moves = [self.root_node]
        
        until moves.empty?
            current_node = moves.shift
            new_move_positions(current_node.value).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                # moves << next_node
            end
            moves += current_node.children
        end
    end

    def find_path(end_pos)
        # debugger
        end_node = self.root_node.dfs(end_pos)
        trace_back_path(end_node)
    end

    def trace_back_path(end_node)
        path = [end_node.value]
        parents_node = end_node.parent

        until parents_node.nil?
            path.unshift(parents_node.value)
            parents_node = parents_node.parent
        end
        path
    end
end