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
    p piece.valid_moves
    piece.valid_moves.include?(stop)
  end

  # check to see if this move is valid & if it will cause checkmate
  # after the check we swap the pieces back to their inital positions
  def check_move(start, stop)
    return false if valid_move?(start, stop) == false # return false if move isn't valid

    # get pieces
    attacked = @board.spaces[stop[0]][stop[1]]
    piece = @board.spaces[start[0]][start[1]]
    # make the move, update valid moves
    @board.spaces[stop[0]][stop[1]] = piece
    @board.spaces[start[0]][start[1]] = nil
    update_valid_moves
    # check if this puts the player in check
    king_loc = find_king(piece.color)
    safe = king_safe(king_loc[0], king_loc[1], piece.color)
    # swap back and update the valid moves list to what it was before
    @board.spaces[start[0]][start[1]] = piece
    @board.spaces[stop[0]][stop[1]] = attacked
    update_valid_moves

    safe # return true if the move is safe
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
                     enemy.valid_moves
                   end
    end
    vunerable
  end
end
