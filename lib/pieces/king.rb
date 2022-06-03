# frozen_string_literal: true

require_relative 'piece'
# old imports validator

# king class
class King < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    @icon = icon_set(color)
  end

  private

  def icon_set(color)
    color == :black ? " \u2654 " : " \u265A "
  end

  def get_valid_moves(row = @location[0], col = @location[1], potential = [])
    @moveset.each do |x, y|
      x1 = x + row
      y1 = y + col
      # not valid if out of bounds
      next if x1.negative || x1 > 7 || y1.negative || y1 > 7

      potential_move = @board[x1][y1]

      # not valid if friendly piece
      next if potential_move.nil? == false && potetnial_move.color == @color

      potential << [x1, y1]
    end
    potential
  end
end
