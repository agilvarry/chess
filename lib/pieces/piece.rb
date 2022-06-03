# frozen_string_literal: true

# piece class
class Piece
  arr_accessor :used, :location, :color, :moveset
  def initalize(board, location, color)
    @moved = false
    @location = location
    @color = color
    @move_set = []
    @board = board
  end

  def valid_move?(move)
    true if @moveset.include?(move)

    false
  end
end
