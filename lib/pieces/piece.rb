# frozen_string_literal: true

class Piece
  def initalize(board, location, color)
    @moved = false
    @location = location
    @color = color
    @moveset = []
    @board = board
  end

  def valid_move?(move)
    true if @moveset.include?(move)

    false
  end
end
