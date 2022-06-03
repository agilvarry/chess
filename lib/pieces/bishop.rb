
require_relative 'piece'

# bishop piece
class Bishop < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = [[1, 1], [-1, -1], [-1, 1], [1, -1]]
    @icon = icon_set(color)
  end

  def icon_set(color)
    color == :black ? " \u2657 " : " \u265D "
  end

  def valid_moves(row = @location[0], col = @location[1], potential = [])
    @moveset.each do |x, y|
      x1 = row + x
      y1 = col + y
      # we check valid moves till we hit a piece or edge
      potential |= expand(x1, y1, x, y)
    end
    potential
  end

  # keep adding the x and y to the row and col til we hit a piece or the end of the board
  def expand(row, col, x, y, potential = [])
    while row.negative? == false && row <= 7 && col.negative? == false && col <= 7
      potential_move = @board[row][col]
      break if potential_move.nil? == false && potential_move.color == @color

      if potential_move.nil? == false && potential_move.color != @color
        potential << [row, col]
        break
      end
      potential << [row, col]
      row += x
      col += y
    end
    potential
  end

end