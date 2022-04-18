# frozen_string_literal: true

# class contaions checks for all pieces
class Piece
  attr_accessor :used, :location, :color, :moveset

  def initialize(location, color)
    @used = false
    @location = location
    @color = color
    @moveset = []
  end

  def valid_move?(move)
    true if @moveset.include?(move)

    false
  end

  def bishop_moves
    moves = []
    (1..7).each { |i| moves.append([-i, -i], [-i, i], [i, -i], [i, i]) }
    moves
  end

  def rook_moves
    moves = []
    (1..7).each { |i| moves.append([i, 0], [0, i], [-i, 0], [0, -i]) }
    moves
  end
end
