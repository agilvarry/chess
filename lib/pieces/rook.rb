# frozen_string_literal: true

require_relative 'piece'

# rook class
class Rook < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[0, -1], [0, 1], [1, 0], [-1, 0]]
    @icon = iconset(color)
  end

  private

  def iconset(color)
    color == :black ? " \u2656 " : " \u265C "
  end
end
