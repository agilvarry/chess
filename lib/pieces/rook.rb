# frozen_string_literal: true

require_relative 'piece'

# rook piece
class Rook < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    @icon = iconset(color)
  end

  def iconset(color)
    color == :white ? " \u2656 " : " \u265C "
  end
end
