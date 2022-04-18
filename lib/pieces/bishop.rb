# frozen_string_literal: true

require_relative 'piece'

# bishop piece
class Bishop < Piece
  def initialize(location, color)
    super
    @moveset = bishop_moves
    @icon = iconset(color)
  end

  def iconset(color)
    color == 'white?' ? ' \u2657 ' : ' u\265D '
  end
end
