# frozen_string_literal: true

require_relative 'piece'

# knight class
class Knight < Piece
  attr_reader :icon, :moveset

  def initialize(board, location, color)
    super
    @moveset = [[1, 2], [2, 1], [2, -1], [1, -2],
                [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    @icon = icon_set(color)
  end

  def update_valid
    @valid_moves = valid_moves
  end
  
  def get_valid_moves(row = @location[0], _col = @location[1], potential = [])
    @moveset.each do |x, y|
      x1 = x + row
      y1 = y + row

      # not valid if out of bounds
      next if x1.negative? || x1 > 7 || y1.negative? || y1 > 7

      potential_move = @board[x1][y1]
      # not valid if space occupied and piece is friendly
      next if potential_move.nil? == false && potential_move.color == @color

      potential << [x1, y1]
    end
    potential
  end
  private

  def icon_set(color)
    color == :black ? " \u2658 " : " \u265E "
  end


end
