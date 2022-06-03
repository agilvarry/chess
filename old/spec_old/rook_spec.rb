# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/rook'
RSpec.describe Rook do
  board = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :bpn, :bpn, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :wpn, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
    [nil, :wpn, :wpn, nil, :wbp, :wpn, :wpn, :wpn],
    [:wrk, nil, :wbp, nil, :wkg, nil, nil, :wrk]
  ]

  context " white rook hasn't moved" do
    subject(:rok) { described_class.new(board, [7, 0], :white) }

    it 'rook is on board' do
      board[7][0] = rok
      board[2][0] = Bishop.new(board, [2, 0], :black)
      board[7][2] = Bishop.new(board, [7, 2], :white)
      expect(board[7][0].instance_of?(Rook)).to be true
    end

    it "rook hasn't moved yet" do
      expect(rok.valid_moves.sort).to eq [[7, 1], [6, 0], [5, 0], [4, 0], [3, 0], [2, 0]].sort
    end
  end
end
