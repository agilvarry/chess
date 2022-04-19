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

  def valid_move(row = @location[0], col = @location[1], potential = [])
    moves = assign_moves
    moves.each do |x, y|
      potential_move = @board[x + row][y + col]
      break unless potential_move.nil? == true

      potential << [x, y]
    end
    potential
  end

  # TODO
  def valid_attack(row = @location[0], col = @location[1], potential = [])
    @attackset.each do |x, y|
      puts x, y
      potential_attack = @board[x + row][y + col]
      potential << [x, y] if potential_attack.nil? == true
    end
    potential
  end

  def assign_moves
    return @moveset[1] if @used == false

    @moveset[0]
  end

  def attack_get(color)
    if color == :white
      [[1, 1], [1, -1]]
    else
      [[-1, 1], [-1, -1]]
    end
  end

  def move_get(color)
    if color == :white
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
