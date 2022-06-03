# frozen_string_literal: true

require_relative 'board'
require_relative 'validator'

board = Board.new
validator = Validator.new(board)

validator.update_valid_moves

# board.display