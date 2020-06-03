class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        # "rook".colorize(color)
    end

    def move_dirs
        diagonal_dirs
    end

end