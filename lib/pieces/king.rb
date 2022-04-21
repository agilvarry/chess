# frozen_string_literal: true

require_relative 'piece'

# rook piece
class King < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :white ? " \u2654 " : " \u265A "
  end

  def valid_moves(row = @location[0], col = @location[1], potential = [])
    @moveset.each do |x, y|
      r = row + x
      c = col + y
      potential |= [r, c)] if @board.validator.king_move(r,c, @color)
    end
    potential
  end


end
