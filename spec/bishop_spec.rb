# frozen_string_literal: true
# # frozen_string_literal: true

# require_relative '../lib/pieces/pawn'
# require_relative '../lib/pieces/knight'
# require_relative '../lib/pieces/bishop'

# RSpec.describe Bishop do
#   board = [
#     [:brk, nil, nil, nil, :bkg, nil, nil, :brk],
#     [:bpn, nil, :bpn, :bpn, :bqn, :bpn, :bsp, nil],
#     [:bsp, :bkt, nil, nil, :bpn, :bkt, :bpn, nil],
#     [nil, nil, nil, :wpn, :wkt, nil, nil, nil],
#     [nil, :bpn, nil, nil, :wpn, nil, nil, nil],
#     [nil, nil, :wkt, nil, nil, :wqn, nil, :bpn],
#     [:wpn, :wpn, :wpn, nil, :wbp, :wpn, :wpn, :wpn],
#     [:wrk, nil, :wbp, nil, :wkg, nil, nil, :wrk]
#   ]

#   context " white bishop hasn't moved" do
#     subject(:bsh) { described_class.new(board, [7, 2], :white) }

#     it 'bishop is on board' do
#       board[7][2] = bsh
#       board[6][1] = Pawn.new(board, [6, 1], :white)
#       expect(board[7][2].instance_of?(Bishop)).to be true
#     end

#     it "bishop hasn't moved yet" do
#       expect(bsh.get_valid_moves.sort).to eq [[6, 3], [5, 4], [4, 5], [3, 6], [2, 7]].sort
#     end
#   end

#   context 'black bishop has moved' do
#     subject(:bsh2) { described_class.new(board, [2, 0], :black) }
#     before do
#       bsh2.instance_variable_set(:@used, true)
#     end

#     it 'bishop is on board' do
#       board[2][0] = bsh2
#       board[6][4] = Bishop.new(board, [6, 4], :white)
#       expect(board[2][0].instance_of?(Bishop)).to be true
#     end

#     it 'black bishop moves' do
#       expect(bsh2.get_valid_moves.sort).to eq [[1, 1], [0, 2], [3, 1], [4, 2], [5, 3], [6, 4]].sort
#     end
#   end
# end
