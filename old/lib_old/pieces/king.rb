# frozen_string_literal: true

require_relative 'piece'
require_relative '../validator'
# rook piece
class King < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :black ? " \u2654 " : " \u265A "
  end

  def valid_moves(row = @location[0], col = @location[1], potential = [])
    @moveset.each do |x, y|
      r = row + x
      c = col + y
      next if r.negative? || r > 7 || c.negative? || c > 7 ||

              potential_move = @board[r][c]
      next if potential_move.nil? == false && potential_move.color == @color

      potential << [r, c]
    end
    potential
  end
end
