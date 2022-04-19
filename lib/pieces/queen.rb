# frozen_string_literal: true

require_relative 'piece'

# rook piece
class Queen < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 0], [0, 1], [-1, 0], [0, -1], [-1, -1], [-1, 1], [1, -1], [1, 1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :white ? " \u2655 " : " \u265B "
  end

  # def queen_moves
  #   rook_moves + bishop_moves
  # end
end
