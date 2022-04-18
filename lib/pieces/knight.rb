# frozen_string_literal: true

require_relative 'piece'

# knight piece
class Knight < Piece
  def initialize(location, color)
    super
    @moveset = [[1, 2], [2, 1], [2, -1], [1, -2],
                [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == 'white?' ? ' \u2658 ' : ' u\265E '
  end
end
