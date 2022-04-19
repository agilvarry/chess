# frozen_string_literal: true

# chess board class
class Board
  def initialize
    @board = boardset(Array.new(8) { Array.new(8, nil) })
    @turns = 0
  end

  def boardset(board)
    board = white_pawns(board)
    board = black_pawns(board)
    board = backrow_white(board)
    backrow_black(board)
  end

  def select_piece; end

  def valid_select?; end

  def move_piece; end
end
