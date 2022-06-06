# frozen_string_literal: true
# # frozen_string_literal: true

# require_relative '../lib/pieces/pawn'
# require_relative '../lib/pieces/knight'

# RSpec.describe Knight do
#     subject(:board) { Board.new }

#   context "knight hasn't moved" do
#     it 'knight is on board' do

#     expect(board.spaces[7][1].instance_of?(Knight)).to be true
#     end

#     it "knight pawn hasn't moved yet" do # broken
#       board.spaces[7][1].update_valid
#       expect(board.spaces[7][1].valid_moves.sort).to eq [[5, 0], [5, 2]].sort
#     end
#   end

#   context 'black knight has moved' do
#     before do
#       knt2.instance_variable_set(:@used, true)
#     end

#     xit 'knight is on board' do
#       board[2][1] = knt2
#       board[0][0] = Rook.new(board, [0, 0], :black)
#       board[3][3] = Pawn.new(board, [3, 3], :white)
#       board[1][3] = Pawn.new(board, [1, 3], :black)
#       expect(board[2][1].instance_of?(Knight)).to be true
#     end

#     xit 'black knight moves' do # broken
#         board[3][3] = Pawn.new(board, [3, 3], :white)
#       expect(knt2.get_valid_moves.sort).to eq [[0, 2], [3, 3], [4, 0], [4, 2]].sort
#     end
#   end
# end
