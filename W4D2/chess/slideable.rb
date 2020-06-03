module Slideable

    ORTHOGONAL_DIRS = [
        [1, 0] #right
        [-1, 0] #left
        [0, 1] #up
        [0, -1] #down
    ].freeze

    DIAGONAL_DIRS = [
        [1, 1] #up-right
        [-1, -1] #down-left
        [1, -1] #right-down
        [-1, 1] #left-up
    ].freeze

    def orthogonal_dirs
        ORTHOGONAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        move_dirs.each do |dir|
            dx, dy = dir
            possible_moves += grow_unblocked_moves_in_dir(dx,dy)
        end
    end

    private 

    def move_dirs
        raise NotImplementedError
    end

    def grow_unblocked_moves_in_dir(dx, dy) #dx=+1, dy=0 => right
        collected_moves = []
        current_pos = self.pos
        new_pos = [current_pos[0]+dx, current_pos[1]+dy]
        keep_moving = true
        while keep_moving
            if valid_pos?(new_pos) && new_pos.empty? 
                collected_moves << new_pos
                current_pos = new_pos 
                new_pos = [new_pos[0]+dx, new_pos[1]+dy] 
            elsif valid_pos?(new_pos) && !new_pos.empty?
                if board[current_pos].color != board[new_pos].color
                    collected_moves << new_pos
                    keep_moving = false
                else
                    keep_moving = false
                end
            end
        end
        collected_moves
    end
end