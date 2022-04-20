# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'

RSpec.describe Knight do
  board = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :bpn, :bpn, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :wpn, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, nil, nil, nil, :wqn, nil, :bpn],
    %i[wpn wpn wpn wbp wbp wpn wpn wpn],
    [:wrk, :wkt, nil, nil, :wkg, nil, nil, :wrk]
  ]

  context "knight hasn't moved" do
    subject(:knt) { described_class.new(board, [7, 1], :white) }

    it 'knight is on board' do
      board[7][1] = knt
      board[6][3] = Bishop.new(board, [6, 3], :white)
      expect(board[7][1].instance_of?(Knight)).to be true
    end

    it "knight pawn hasn't moved yet" do
      expect(knt.valid_moves.sort).to eq [[5, 0], [5, 2]].sort
    end
  end

  context 'black knight has moved' do
    subject(:knt2) { described_class.new(board, [2, 1], :black) }
    before do
      knt2.instance_variable_set(:@used, true)
    end

    it 'knight is on board' do
      board[2][1] = knt2
      board[0][0] = Rook.new(board, [0, 0], :black)
      board[3][3] = Pawn.new(board, [3, 3], :white)
      board[1][3] = Pawn.new(board, [1, 3], :black)
      expect(board[2][1].instance_of?(Knight)).to be true
    end

    it 'black knight moves' do
      board[3][3] = Pawn.new(board, [3, 3], :white)
      expect(knt2.valid_moves.sort).to eq [[0, 2], [3, 3], [4, 0], [4, 2]].sort
    end
  end
end
