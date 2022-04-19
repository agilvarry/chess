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
end
