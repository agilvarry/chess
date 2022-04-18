# frozen_string_literal: true

require_relative 'piece'

# rook piece
class Queen < Piece
  def initialize(location, color)
    super
    @moveset = queen_moves
    @icon = iconset(color)
  end

  def iconset(color)
    color == 'white?' ? ' \u2655 ' : ' u\265B '
  end

  def queen_moves
    rook_moves + bishop_moves
  end
end

q = Queen.new(1, 'f')
p q.moveset
