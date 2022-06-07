# frozen_string_literal: true

require_relative 'board'
require_relative 'validator'

class Game
  def initialize
    @board = Board.new
    @validator = Validator.new(@board)
    @player = :white
    @letter_key = %w[a b c d e f g h]
  end

  def is_number?(string)
    true if Float(string)
  rescue StandardError
    false
  end

  def start
    puts 'Welcome to chess!'
    game
  end

  def player_prompt
    @board.display
    puts "Player #{@player} you're up!"
    if in_check? == true
      puts "You're in check!"
    end
    puts "Enter the piece you'd like to move, ex: a7 and where you'd like to move it"
    start = gets.chomp.split('')
    puts "..and where you'd like to move it ex: a6"
    stop = gets.chomp.split('')
    [start, stop]
  end

  def in_check?
    king_loc = @validator.find_king(@player)
    @validator.king_safe(king_loc[0], king_loc[1], @player)
  end

  def validate_input(moves)
    x = moves[0]
    y = moves[1]
    return false if @letter_key.include?(x) == false

    return true if y.to_i.between?(0, 7)

    false
  end

  def transform(move)
    x = @letter_key.find_index(move[0].downcase)
    y = move[1].to_i - 1

    # reverse because that's how the array works
    [y, x]
  end

  def swap_player
    @player = @player == :white ? :black : :white
  end

  def validate_and_move(moves)
    start = transform(moves[0])
    stop = transform(moves[1])

    if @validator.valid_select?(start, @player)
      if @validator.check_move(start, stop) == true
        @board.move_piece(start, stop)
        swap_player
      else
        puts "can't do that!!"
      end
    else
      puts 'not your piece!!'
    end
  end

  def game
    loop do
      @validator.update_valid_moves
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
