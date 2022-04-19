# frozen_string_literal: true

# class contaions checks for all pieces
class Piece
  attr_accessor :used, :location, :color, :moveset

  def initialize(board, location, color)
    @used = false
    @location = location
    @color = color
    @moveset = []
    @board = board
  end

  def valid_move?(move)
    true if @moveset.include?(move)

    false
  end

  # def bishop_moves
  #   moves = []
  #   (1..7).each { |i| moves.append([-1, -1], [-1, 1], [1, -1], [1, 1]) }
  #   moves
  # end

  # def rook_moves
  #   moves = []
  #   (1..7).each { |i| moves.append([1, 0], [0, 1], [-1, 0], [0, -1]) }
  #   moves
  # end
end
