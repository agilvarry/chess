# frozen_string_literal: true

# this class provides validation for all moves
class Validator
  attr_reader :board, :white_vunerable, :black_vunerable

  def initialize(board)
    @board = board
    @white_vunerable = vunerable_to_attack(:white)
    @black_vunerable = vunerable_to_attack(:black)
  end

  def king_safe(row, col, color)
    unsafe = vunerable_to_attack(color)
    return false if unsafe.includes?([row, col])

    true
  end

  def valid_select?(move, color)
    piece = @board[move[0]][move[1]]
    return false if piece.nil?
    return false if piece.color != color

    true
  end

  def fetch_pieces(color)
    @board.flatten.select { |cell| cell.nil? == false && cell.color == color }
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
                     enemy.valid_moves
                   end
    end
    vunerable
  end
end
