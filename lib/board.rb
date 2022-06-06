# frozen_string_literal: true

require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './pieces/queen'
require_relative './pieces/rook'

# chess board class
class Board
  attr_reader :spaces, :white_claimed, :black_claimed

  def initialize
    @spaces = board_set(Array.new(8) { Array.new(8, nil) })
    @white_claimed = []
    @black_claimed = []
  end

  def pawns(color, row, board)
    (0..7).each do |column|
      board[row][column] = Pawn.new(board, [row, column], color)
    end
    board
  end

  def backrow(color, row, board)
    board[row][0] = Rook.new(board, [row, 0], color)
    board[row][1] = Knight.new(board, [row, 1], color)
    board[row][2] = Bishop.new(board, [row, 2], color)
    board[row][3] = Queen.new(board, [row, 3], color)
    board[row][4] = King.new(board, [row, 4], color)
    board[row][5] = Bishop.new(board, [row, 5], color)
    board[row][6] = Knight.new(board, [row, 6], color)
    board[row][7] = Rook.new(board, [row, 7], color)
    board
  end

  # set up initial piece locations
  def board_set(board)
    board = pawns(:white, 6, board)
    board = pawns(:black, 1, board)
    board = backrow(:white, 7, board)
    backrow(:black, 0, board)
  end

  # move a piece to a new location, claim piece if it's occupied
  def move_piece(start, move)
    x = start[0]
    y = start[1]
    x1 = move[0]
    y1 = move[1]
    piece = @spaces[x][y]
    claim_piece(move) if @spaces[x1][y1].nil? == false
    @spaces[x1][y1] = piece
    @spaces[x][y] = nil
    piece.used = true
    piece.location = [x1, y1]
  end

  def claim_piece(loc)
    piece = @spaces[loc[0]][loc[1]]
    if piece.color == :black
      @white_claimed.append(piece)
    else
      @black_claimed.append(piece)
    end
  end

  def board_header
    ('a'..'h').reduce('   ') { |accum, letter| accum + " #{letter}  " }
  end

  def display
    puts board_header
    (0..7).each do |row|
      view = "#{row + 1} |"
      (0..7).each do |column|
        view += @spaces[row][column].nil? ? '   ' : @spaces[row][column].icon
        view += '|'
      end
      puts "#{view} #{row + 1}"
    end
    puts board_header
  end
end
