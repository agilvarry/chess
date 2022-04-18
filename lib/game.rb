# frozen_string_literal: true

require_relative 'board'
# class to control game
class Game
  def initialize
    @board = Board.new
  end
end
