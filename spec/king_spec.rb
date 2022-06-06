# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'
require_relative '../lib/pieces/king'
require_relative '../lib/board'

RSpec.describe King do
  board = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :bpn, nil, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, :wpn, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :bpn, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
    [:wpn, :wpn, :wpn, nil, :wbp, :wpn, :wpn, :wpn],
    [:wrk, nil, :wbp, nil, :wkg, nil, nil, :wrk]
  ]

  context ' white king moves, no accounting for check' do
    subject(:board) { Board.new }
    subject(:kng) { described_class.new(board, [7, 4], :white) }

    it 'king is on board' do
      board[7][4] = kng
      board[6][4] = Bishop.new(board, [6, 4], :white)
      board[6][5] = Pawn.new(board, [6, 5], :white)
      expect(board[7][4].instance_of?(King)).to be true
    end

    it 'king moves' do
      expect(kng.get_valid_moves.sort).to eq [[7, 3], [7, 5], [6, 3]].sort
    end
  end

  context 'black king moves' do
    subject(:bkg) { described_class.new(board, [0, 4], :black) }

    it 'king is on board, no accounting for check' do
      board[0][4] = bkg
      board[2][2] = Pawn.new(board, [2, 2], :white)
      board[1][5] = Queen.new(board, [1, 5], :black)
      board[1][6] = Pawn.new(board, [2, 2], :black)
      expect(board[0][4].instance_of?(King)).to be true
    end

    xit 'king moves' do #broken test
      expect(bkg.get_valid_moves.sort).to eq [[0, 3], [0, 5], [1, 3]].sort
    end
  end
end
