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
  white_attack_init = []
  describe '#initialize' do
    it 'validator initialized' do
      expect(board.validator.instance_of?(Validator)).to be true
    end

    context 'initial attack patterns' do
      white_attack_init = [[5, 0], [5, 2], [5, 5], [5, 7]]
      black_attack_init = [[2, 0], [2, 2], [2, 5], [2, 7]]
      it 'white attack init' do
        expect(board.validator.white_vunerable.sort).to eq(black_attack_init.sort)
      end

      it 'black attack init' do
        expect(board.validator.black_vunerable.sort).to eq(white_attack_init.sort)
      end
    end
  end
end