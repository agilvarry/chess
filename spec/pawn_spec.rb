# frozen_string_literal: true

require_relative '../lib/pieces/pawn'

RSpec.describe Pawn do
  # let(:board) {instance_double(Board)}
  kiwipete = [
    [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
    [:bpn, nil, :bpn, :bpn, :bqn, :bpn, :bsp, nil],
    [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
    [nil, nil, nil, :wpn, :wkt, nil, nil, nil],
    [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
    [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
    %i[wpn wpn wpn wbp wbp wpn wpn wpn],
    [:wrk, nil, nil, nil, :wkg, nil, nil, :wrk]
  ]
  #   board.spaces = kiwipete
  context "black pawn hasn't moved, unblocked" do
    subject(:pwn) { Pawn.new(kiwipete, [1, 2], :black) }

    it 'pawn is on board' do
      kiwipete[1][2] = pwn
      expect(kiwipete[1][2].instance_of?(Pawn)).to be true
    end
  end
end
