class Board
    attr_accessor :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) {[]} }
        @sentinel = NullPiece
        @rows[1].map { |pos| pos << @pawn.color(:W) }
        @rows[6].map { |pos| pos << @pawn.color(:B) }
        (2..5).each do |i|
            @rows[i].map { |pos| pos << @sentinel }
        end

    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise "no piece at selected position" if self[start_pos].empty?
        raise "invalid move" unless self[end_pos].empty?
    end
    
    private
    attr_reader :sentinel
end