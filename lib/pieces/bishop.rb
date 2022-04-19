# frozen_string_literal: true

require_relative 'piece'

# bishop piece
class Bishop < Piece
  def initialize(board, location, color)
    super
    @moveset = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :white ? ' \u2657 ' : ' u\265D '
  end
end
