# frozen_string_literal: true

require_relative 'piece'

# queen class
class Queen < Piece
  attr_reader :icon

  def initalize(board, location, color)
    super
    @moveset = [[1, 0], [0, 1], [-1, 0], [0, -1], [-1, -1], [-1, 1], [1, -1], [1, 1]]
    @icon = icon_set(color)
  end

  private

  def icon_set(color)
    color == :black ? " \u2655 " : " \u265B "
  end
end
