# frozen_string_literal: true

require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/queen'
require_relative '../lib/pieces/rook'
require_relative '../lib/board'
require_relative '../lib/validator'

RSpec.describe Validator do
  subject(:board) { Board.new }
  subject(:validator) { described_class.new(board.spaces) }
  white_attack_init = []
  describe '#initialize' do
    xit 'validator initialized' do
      expect(validator.instance_of?(Validator)).to be true
    end

    context 'initial attack patterns' do
      white_attack_init = [[5, 0], [5, 2], [5, 5], [5, 7]]
      black_attack_init = [[2, 0], [2, 2], [2, 5], [2, 7]]
      xit 'white attack init' do
        expect(validator.white_vunerable.sort).to eq(black_attack_init.sort)
      end

      xit 'black attack init' do
        expect(validator.black_vunerable.sort).to eq(white_attack_init.sort)
      end
    end

    context 'valid piece'
    xit 'valid choice' do
      expect(validator.valid_select?([6, 0], :white)).to be true
    end

    xit 'white cannot pick black' do
      expect(validator.valid_select?([1, 0], :white)).to be false
    end

    xit 'black cannot pick white' do
      expect(validator.valid_select?([6, 0], :black)).to be false
    end

    xit 'cannot select piece from blank space' do
      expect(validator.valid_select?([3, 0], :black)).to be false
    end
  end
end
