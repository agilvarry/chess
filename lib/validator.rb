# frozen_string_literal: true

# this class provides validation for all moves
class Validator
  def initialize(board)
    @white_pieces = []
    @black_pieces = []
    @white_attack = []
    @black_attack = []
    @board = board
  end

  def king_move(row, col, color)
    
    false
  end
end
