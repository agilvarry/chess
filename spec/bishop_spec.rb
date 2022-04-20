# frozen_string_literal: true

require_relative '../lib/pieces/pawn'
require_relative '../lib/pieces/knight'
require_relative '../lib/pieces/bishop'

RSpec.describe Bishop do
  board = [
    [:brk, nil, nil, nil,:bkg, nil, nil,:brk],
    [:bpn, nil,:bpn,:bpn,:bqn,:bpn,:bsp, nil],
    [:bsp,:bkt, nil, nil,:bpn,:bkt,:bpn, nil],
    [nil,  nil, nil,:wpn,:wkt, nil, nil, nil],
    [nil, :bpn, nil, nil,:wpn, nil, nil, nil],
    [nil,  nil,:wkt, nil, nil,:wqn, nil,:bpn],
    [:wpn,:wpn,:wpn, nil,:wbp,:wpn,:wpn,:wpn],
    [:wrk, nil,:wbp, nil,:wkg, nil, nil,:wrk]
  ]

  context " white knight hasn't moved" do
    subject(:bsh) { described_class.new(board, [7, 2], :white) }

    xit 'bishop is on board' do
      board[7][2] = bsh
      board[6][1] = Pawn.new(board, [6, 1], :white)
      expect(board[7][1].instance_of?(Knight)).to be true
    end

    xit "knight pawn hasn't moved yet" do
      expect(bsh.valid_moves.sort).to eq [[6,3],[5,4], [4,5], [3,6], [2,7]].sort
    end
  end

  board = [
    [:brk, nil, nil, nil,:bkg, nil, nil,:brk],
    [:bpn, nil,:bpn,:bpn,:bqn,:bpn,:bsp, nil],
    [:bsp,:bkt, nil, nil,:bpn,:bkt,:bpn, nil],
    [nil,  nil, nil,:wpn,:wkt, nil, nil, nil],
    [nil, :bpn, nil, nil,:wpn, nil, nil, nil],
    [nil,  nil,:wkt, nil, nil,:wqn, nil,:bpn],
    [:wpn,:wpn,:wpn, nil,:wbp,:wpn,:wpn,:wpn],
    [:wrk, nil,:wbp, nil,:wkg, nil, nil,:wrk]
  ]

  context 'black bishop  has moved' do
    subject(:bsh2) { described_class.new(board, [3, 0], :black) }
    before do
      bsh2.instance_variable_set(:@used, true)
    end

    xit 'knight is on board' do
      board[3][0] = bsh2
      board[6][4] = Bishop.new(board,[6,4], :white)
      expect(board[2][1].instance_of?(Knight)).to be true
    end

    xit 'black knight moves' do
      expect(knt2.valid_moves.sort).to eq [[0, 2], [3, 3], [4, 0], [4, 2]].sort
    end
  end
end
