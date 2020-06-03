class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        # "rook".colorize(color)
    end

    def move_dirs
        diagonal_dirs + orthogonal_dirs
    end

end