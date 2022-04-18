# frozen_string_literal: true

require_relative 'piece'

# rook piece
class Rook < Piece
  def initialize(location, color)
    super
    @moveset = rook_moves
    @icon = iconset(color)
  end

  def iconset(color)
    color == 'white?' ? ' \u2656 ' : ' u\265C '
  end
end
