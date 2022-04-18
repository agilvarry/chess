# frozen_string_literal: true

require_relative 'piece'

# pawn class
class Pawn < Piece
  def initialize(location, color)
    super
    @moveset = [[[1, 0]], [1, 0], [2, 0]]
    @icon = iconset(color)
  end

  def moveset
    if @color == 'white'
      [[[1, 0]], [1, 0], [2, 0]]
    else
      [[[-1, 0]], [-1, 0], [-2, 0]]
    end
  end

  def iconset(color)
    color == 'white?' ? ' \u2659 ' : ' u\265F '
  end

  def valid_move?(move)
    true if (@used == true) && @moveset.include?(move)
    false
  end
end
