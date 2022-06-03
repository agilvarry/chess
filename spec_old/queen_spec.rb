# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'

RSpec.describe Queen do
  board = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :bpn, :bpn, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :wpn, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
    [:wpn, :wpn, :wpn, nil, :wbp, :wpn, :wpn, :wpn],
    [:wrk, nil, :wbp, nil, :wkg, nil, nil, :wrk]
  ]

  context ' white queen moved' do
    subject(:wqn) { described_class.new(board, [5, 5], :white) }

    it 'queen is on board' do
      board[5][5] = wqn
      board[6][4] = Bishop.new(board, [6, 4], :white)
      board[6][5] = Pawn.new(board, [6, 5], :white)
      board[6][6] = Pawn.new(board, [6, 6], :white)
      board[5][7] = Pawn.new(board, [5, 7], :black)
      board[2][5] = Knight.new(board, [2, 5], :black)
      board[4][4] = Pawn.new(board, [6, 6], :white)
      board[5][2] = Knight.new(board, [5, 2], :white)
      expect(board[5][5].instance_of?(Queen)).to be true
    end

    it 'queen moves' do
      expect(wqn.valid_moves.sort).to eq [[5, 6], [5, 7], [4, 6], [3, 7], [4, 5], [3, 5], [2, 5], [5, 4], [5, 3]].sort
    end
  end
end
