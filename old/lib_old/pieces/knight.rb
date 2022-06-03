# frozen_string_literal: true

require_relative 'piece'

# knight piece
class Knight < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 2], [2, 1], [2, -1], [1, -2],
                [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :black ? " \u2658 " : " \u265E "
  end

  def valid_moves(row = @location[0], col = @location[1], potential = [])
    @moveset.each do |x, y|
      x1 = x + row
      y1 = y + col

      next if x1.negative? || x1 > 7 || y1.negative? || y1 > 7

      potential_move = @board[x1][y1]
      next if potential_move.nil? == false && potential_move.color == @color

      potential << [x1, y1]
    end
    potential
  end
end
