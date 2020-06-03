class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8, nil) }
        # @sentinel = NullPiece.instance
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def move_piece(color, start_pos, end_pos)
        raise "no piece at selected position" if self[start_pos].empty?
        raise "invalid move" unless self[end_pos].empty?
        if valid_move?(color, end_pos)
            @rows[end_pos] = @rows[start_pos]
            @rows[start_pos] = nil #null piece later
        end
    end

    def fill_board
        colors = %i(white black)
        @rows.each.with_index do |row, i|
            if i == 0 || i == 7
                row.map! { |pos| pos = (colors[0]) } if i == 0
                row.map! { |pos| pos = (colors[1]) } if i == 7
            elsif i == 1 || i == 6
                row.map! { |pos| pos = (colors[0]) } if i == 1
                row.map! { |pos| pos = (colors[1]) } if i == 6
            else
                row.map! { |pos| pos = nil }
            end     
        end
    end

end