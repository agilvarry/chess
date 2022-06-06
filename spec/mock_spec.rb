# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/validator'

RSpec.describe Validator do
  subject(:board) { Board.new }
  subject(:validator) { Validator.new(board) }

  it '#short game' do
    helper(:white)
    # white turn 1 [6, 5] -> [5, 5]
    expect(validator.valid_select?([6, 5], :white)).to be(true)
    expect(validator.valid_move?([6, 5], [5, 5])).to be(true)
    board.move_piece([6, 5], [5, 5])
    # black turn 1 [1, 4] -> [3, 4]
    helper(:black)
    expect(validator.valid_select?([1, 4], :black)).to be(true)
    expect(validator.valid_move?([1, 4], [3, 4])).to be(true)
    board.move_piece([1, 4], [3, 4])
    # white turn 2 [6, 6] -> [4, 6]
    helper(:white)
    expect(validator.valid_select?([6, 6], :white)).to be(true)
    expect(validator.valid_move?([6, 6], [4, 6])).to be(true)
    board.move_piece([6, 6], [4, 6])
    # black turn 2 [0, 3] -> [4, 7]
    helper(:black)
    expect(validator.valid_select?([0, 3], :black)).to be(true)
    expect(validator.valid_move?([0, 3], [4, 7])).to be(true)
    board.move_piece([0, 3], [4, 7])
    # white turn 3 checkmate
    helper(:white)
    king = validator.find_king(:white)
    safe = validator.king_safe(king[0], king[1], :white)
    expect(safe).to be(false)
    validator.check_move([4, 6], [5, 6])
    expect(validator.check_move([4, 6], [3, 6])).to be(false)
  end

  def helper(_color)
    validator.update_valid_moves
    board.display
  end
end
