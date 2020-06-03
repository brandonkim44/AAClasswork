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
        move_dirs.each
    end

    def move_dirs
        raise NotImplementedError
    end
end