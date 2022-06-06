# frozen_string_literal: true

require_relative 'board'
require_relative 'validator'

class Game
  def initialize
    @board = Board.new
    @validator = Validator.new(@board)
    @player = :White
    @letter_key = %w[a b c d e f g h]
  end

  def start
    puts 'Welcome to chess!'
    game
  end

  def player_prompt
    @board.display
    puts "Player #{@player} you're up!"
    puts "Enter the piece you'd like to move, ex: a7 and where you'd like to move it"
    start = gets.chomp.split('')
    puts "..and where you'd like to move it ex: a6"
    stop = gets.chomp.split('')
    [start, stop]
  end

  def validate_input(moves)
    start = moves[0]
    stop = moves[1]
    false if @letter_key.include?(start) == false || @letter_key.include?(stop) == false

    true if stop.numeric? && stop.to_i.between?(-1, 8)

    false
  end

  def transform(move)
    x = @letter_key.find_index(moves[0].downcase)
    y = move[1].to_i

    [x, y]
  end

  def swap_player
    @player = player == :White ? :Black : :White
  end

  def validate_and_move(moves)
    start = transform(moves[0])
    stop = transform(moves[1])
    if validator.check_move(start, stop) == true

    else
      'not a valid move!'
    end
  end

  def game
    loop do
      moves = player_prompt
      if validate_input(moves[0]) && validate_input(moves[1])
        validate_and_move(moves)
      else
        puts "That's not a valid move"
      end
    end
  end
end

Game.new.start
