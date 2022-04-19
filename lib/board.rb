# frozen_string_literal: true

require_relative './pieces/bishop'
require_relative './pieces/king'
require_relative './pieces/knight'
require_relative './pieces/pawn'
require_relative './pieces/queen'
require_relative './pieces/rook'

# chess board class
class Board
  attr_reader :spaces

  def initialize
    @spaces = boardset(Array.new(8) { Array.new(8, nil) })
    @turns = 0
  end

  def boardset(board)
    board = pawns(:white, 6, board)
    board = pawns(:black, 1, board)
    board = backrow(:white, 7, board)
    backrow(:black, 0, board)
  end

  def select_piece; end

  def pawns(color, row, board)
    (0..7).each do |column|
      board[row][column] = Pawn.new(@spaces, [row, column], color)
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

  def valid_select?; end

  def move_piece; end

  def board_header
    ('a'..'h').reduce('   ') { |accum, letter| accum += " #{letter}  " }
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

b = Board.new
b.display
