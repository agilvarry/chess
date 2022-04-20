# frozen_string_literal: true

require_relative 'piece'

# pawn class
class Pawn < Piece
  attr_reader :icon

  def initialize(board, location, color)
    super
    @moveset = move_get(color)
    @attackset = attack_get(color)
    @icon = iconset(color)
  end

  def valid_moves(row = @location[0], col = @location[1], potential = [])
    moves = assign_moves
    moves.each do |x, y|
      x1 = x + row
      y1 = y + col

      next if x1.negative? && x1 > 7 || y1.negative? && y1 > 7

      potential_move = @board[x1][y1]
      break unless potential_move.nil? == true

      potential << [x1, y1]
    end
    potential
  end

  # TODO
  def valid_attacks(row = @location[0], col = @location[1], potential = [])
    @attackset.each do |x, y|
      x1 = x + row
      y1 = y + col
      next if x1.negative? || x1 > 7 || y1.negative? || y1 > 7

      potential_attack = @board[x1][y1]

      next if potential_attack.nil? == true || potential_attack.color == @color

      potential << [x1, y1]
    end
    potential
  end

  def assign_moves
    return @moveset[1] if @used == false

    @moveset[0]
  end

  def attack_get(color)
    if color == :black
      [[1, 1], [1, -1]]
    else
      [[-1, 1], [-1, -1]]
    end
  end

  def move_get(color)
    if color == :black
      [[[1, 0]], [[1, 0], [2, 0]]]
    else
      [[[-1, 0]], [[-1, 0], [-2, 0]]]
    end
  end

  def iconset(color)
    color == :white ? " \u2659 " : " \u265F "
  end

  def valid_move?(move)
    true if (@used == true) && @moveset.include?(move)
    false
  end
end
