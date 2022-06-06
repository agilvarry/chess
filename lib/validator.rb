# frozen_string_literal: true

# this class provides validation for all moves
class Validator
  attr_reader :board, :white_vunerable, :black_vunerable

  def initialize(board)
    @board = board
  end

  def king_safe(row, col, color)
    unsafe = vunerable_to_attack(color)
    return false if unsafe.include?([row, col])

    true
  end

  def find_king(color)
    king = @board.spaces.flatten.select do |piece|
             piece.nil? == false && piece.instance_of?(King) && piece.color == color
           end [0]
    king.location
  end

  def update_valid_moves
    @board.spaces.flatten.each do |piece|
      piece.update_valid if piece.nil? == false
    end
  end

  def valid_select?(move, color)
    piece = @board.spaces[move[0]][move[1]]
    return false if piece.nil?
    return false if piece.color != color

    true
  end

  def valid_move?(start, stop)
    piece = @board.spaces[start[0]][start[1]]
    piece.valid_moves.include?(stop)
  end

  def fetch_pieces(color)
    @board.spaces.flatten.select { |cell| cell.nil? == false && cell.color == color }
  end

  def enemy_pieces(color)
    return fetch_pieces(:black) if color == :white

    fetch_pieces(:white)
  end

  def vunerable_to_attack(color)
    enemies = enemy_pieces(color)
    vunerable = []
    enemies.each do |enemy|
      vunerable |= if enemy.instance_of?(Pawn)
                     enemy.valid_attacks
                   else
                     p enemy.icon
                     p enemy.valid_moves
                     enemy.valid_moves
                   end
    end
    vunerable
  end
end
