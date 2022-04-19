# frozen_string_literal: true

require_relative 'piece'

# rook piece
class Rook < Piece
  def initialize(board, location, color)
    super
    @moveset = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :white ? ' \u2656 ' : ' u\265C '
  end
end
