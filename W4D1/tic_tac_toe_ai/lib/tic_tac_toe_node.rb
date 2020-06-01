require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0...@board.rows.length).each do |row|
      (0...@board.rows.length).each do |col|
        pos = [row, col]
        if @board.empty?(pos) #probably need another if statement here to decide which marker we are going to use. like if marker == x make it o and vice a versa.
          dup_board = self.board.dup
          dup_board[pos] = self.next_mover_mark 
          children << TicTacToeNode.new(dup_board, :o, pos)
        end
      end
    end

    children
  end
end
