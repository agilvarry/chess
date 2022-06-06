# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/validator'

RSpec.describe Validator do
  subject(:board) { Board.new }
  subject(:validator) { described_class.new(board) }
  white_attack_init = []

  describe '#initialize' do
    it 'validator initialized' do
      expect(validator.instance_of?(Validator)).to be true
    end

    context 'initial attack patterns' do
      white_attack_init = [[5, 0], [5, 2], [5, 5], [5, 7]]
      black_attack_init = [[2, 0], [2, 2], [2, 5], [2, 7]]

      it 'white attack init' do
        validator.update_valid_moves
        validator.update_vuberable_list
        expect(validator.white_vunerable.sort).to eq(black_attack_init.sort)
      end

      it 'black attack init' do
        validator.update_valid_moves
        validator.update_vuberable_list
        expect(validator.black_vunerable.sort).to eq(white_attack_init.sort)
      end
    end

    context 'valid piece'
    it 'valid choice' do
      expect(validator.valid_select?([6, 0], :white)).to be true
    end

    it 'white cannot pick black' do
      expect(validator.valid_select?([1, 0], :white)).to be false
    end

    it 'black cannot pick white' do
      expect(validator.valid_select?([6, 0], :black)).to be false
    end

    it 'cannot select piece from blank space' do
      expect(validator.valid_select?([3, 0], :black)).to be false
    end
  end

  context 'kings'
  it 'get white' do
    expect(validator.find_king(:white)).to eq([7, 4])
  end
  it 'get black' do
    expect(validator.find_king(:black)).to eq([0, 4])
  end
end
