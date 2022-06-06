# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'

RSpec.describe Pawn do
  board = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :pwn1, :bpn, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :wpn1, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
    %i[wpn wpn wpn wbp wbp wpn wpn wpn],
    [:wrk, nil, nil, nil, :wkg, nil, nil, :wrk]
  ]
  context "black pawn hasn't moved, unblocked" do
    subject(:pwn) { described_class.new(board, [1, 2], :black) }

    xit 'pawn is on board' do
      board[1][2] = pwn
      expect(board[1][2].instance_of?(Pawn)).to be true
    end

    xit "black pawn hasn't moved yet" do
      expect(pwn.valid_moves).to eq [[2, 2], [3, 2]]
    end

    xit 'black pawn cannot attack' do
      board[2][1] = Knight.new(board, [2, 1], :black)
      expect(pwn.valid_attacks).to eq []
    end
  end

  context 'white pawn has moved, unblocked, can attack' do
    subject(:pwn2) { described_class.new(board, [3, 3], :white) }
    before do
      pwn2.instance_variable_set(:@used, true)
    end

    xit 'pawn is on board' do
      board[3][3] = pwn2
      expect(board[3][3].instance_of?(Pawn)).to be true
    end

    xit 'white pawn hast moved yet' do
      expect(pwn2.valid_moves).to eq [[2, 3]]
    end

    xit 'white pawn can attack' do
      board[2][4] = described_class.new(board, [2, 4], :black)
      expect(pwn2.valid_attacks).to eq [[2, 4]]
    end
  end

  context "black pawn can't move or attack" do
    subject(:pwn3) { described_class.new(board, [1, 0], :black) }

    xit 'pawn is on board' do
      board[1][0] = pwn3
      expect(board[1][0].instance_of?(Pawn)).to be true
    end

    xit 'pawn cant move' do
      expect(pwn3.valid_moves).to eq []
    end

    xit 'pawn cant attack' do
      board[2][1] = Knight.new(board, [2, 1], :black)
      expect(pwn3.valid_attacks).to eq []
    end
  end
end
