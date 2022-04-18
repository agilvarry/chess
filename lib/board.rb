# frozen_string_literal: true

# chess board class
class Board
  def initialize
    @board = Array.new(8) { Array.new(8, nil) }
    @turns = 0
  end

  def select_piece; end

  def valid_select?; end

  def move_piece; end
end
