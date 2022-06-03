# frozen_string_literal: true

require_relative 'piece'

# pawn class
class Pawn < Piece
  attr_reader :icon

  def initalize(board, location, color)
    super
    @moveset = move_get(color)
    @attack_set = attack_get(color)
    @icon = icon_set(color)
  end

  # assign the potential moves based on if the pawn has been moved yet
  def assign_moves
    return @moveset[1] if @used == false

    @moveset[0]
  end

  # assign moveset(s) based on piece color
  def move_get(color)
    if color == :black
      [[[1, 0]], [[1, 0], [2, 0]]]
    else # white
      [[[-1, 0]], [[-1, 0], [-2, 0]]]
    end
  end

  # set ascii icon based on piece color
  def icon_set(color)
    color == :black ? " \u2659 " : " \u265F "
  end

  # gather valid moves for this pawn
  def valid_moves(row = @location[0], col = @location[1], potential = [])
    moves = assign_moves

    moves.each do |x, y|
      x1 = x + row
      y1 = y + col
      # if the x or 7 is out of bounds it's not valid
      next if x1.negative? || x1 > 7 || y1.negative? || y1 > 7

      potential_attack = @board[x1][y1]
      # can't attack if the space is empty or occupied by friendly piece
      next if potential_attack.nil? == true || potential_attack.color == @color

      potential << [x1, y1]
    end
    potential
  end

  # old has a valid_move? method, but maybe we leave that up to the validator?
  # def valid_move?(move)
  #     true if (@used == true) && @moveset.include?(move)
  #     false
  #   end
end
