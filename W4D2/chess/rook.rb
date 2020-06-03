class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        # "rook".colorize(color)
    end

    def move_dirs
        orthogonal_dirs
    end

end

#  STRAIGHT_DIRS = [
#         [1, 0]
#         [-1, 0]
#         [0, 1]
#         [0, -1]
#     ].freeze

#     DIAGONAL_DIRS = [
#         [1, 1] #up-right
#         [-1, -1] #down-left
#         [1, -1] #right-down
#         [-1, 1] #left-up
#     ].freeze