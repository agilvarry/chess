# frozen_string_literal: true

require_relative 'piece'

# bishop piece
class Bishop < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    @icon = icon_set(color)
  end

  private

  def icon_set(color)
    color == :black ? " \u2657 " : " \u265D "
  end
end
