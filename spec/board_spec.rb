# frozen_string_literal: true
# # frozen_string_literal: true

# require_relative '../lib/pieces/bishop'
# require_relative '../lib/pieces/king'
# require_relative '../lib/pieces/knight'
# require_relative '../lib/pieces/pawn'
# require_relative '../lib/pieces/queen'
# require_relative '../lib/pieces/rook'
# require_relative '../lib/board'
# require_relative '../lib/validator'

# RSpec.describe Board do
#   subject(:board) { described_class.new }

#   describe '#initialize' do
#     it 'white pawns starting position' do
#       expect(board.spaces[6].all? { |p| p.instance_of?(Pawn) && p.color == :white }).to be true
#     end

#     it 'white king starting position' do
#       p = board.spaces[7][4]
#       expect(p.instance_of?(King) && p.color == :white).to be true
#     end
#     it 'white queen starting position' do
#       p = board.spaces[7][3]
#       expect(p.instance_of?(Queen) && p.color == :white).to be true
#     end

#     it 'white rooks starting position' do
#       p1 = board.spaces[7][0]
#       p2 = board.spaces[7][7]
#       b1 = p1.instance_of?(Rook) && p1.color == :white
#       b2 = p2.instance_of?(Rook) && p2.color == :white
#       expect(b1 && b2).to be true
#     end

#     it 'white knights starting position' do
#       p1 = board.spaces[7][6]
#       p2 = board.spaces[7][1]
#       b1 = p1.instance_of?(Knight) && p1.color == :white
#       b2 = p2.instance_of?(Knight) && p2.color == :white
#       expect(b1 && b2).to be true
#     end

#     it 'white bishops starting position' do
#       p1 = board.spaces[7][2]
#       p2 = board.spaces[7][5]
#       b1 = p1.instance_of?(Bishop) && p1.color == :white
#       b2 = p2.instance_of?(Bishop) && p2.color == :white
#       expect(b1 && b2).to be true
#     end

#     it 'black pawns starting position' do
#       expect(board.spaces[1].all? { |p| p.instance_of?(Pawn) && p.color == :black }).to be true
#     end

#     it 'white king starting position' do
#       p = board.spaces[0][4]
#       expect(p.instance_of?(King) && p.color == :black).to be true
#     end
#     it 'white queen starting position' do
#       p = board.spaces[0][3]
#       expect(p.instance_of?(Queen) && p.color == :black).to be true
#     end

#     it 'white rooks starting position' do
#       p1 = board.spaces[0][0]
#       p2 = board.spaces[0][7]
#       b1 = p1.instance_of?(Rook) && p1.color == :black
#       b2 = p2.instance_of?(Rook) && p2.color == :black
#       expect(b1 && b2).to be true
#     end

#     it 'white knights starting position' do
#       p1 = board.spaces[0][6]
#       p2 = board.spaces[0][1]
#       b1 = p1.instance_of?(Knight) && p1.color == :black
#       b2 = p2.instance_of?(Knight) && p2.color == :black
#       expect(b1 && b2).to be true
#     end

#     it 'white bishops starting position' do
#       p1 = board.spaces[0][2]
#       p2 = board.spaces[0][5]
#       b1 = p1.instance_of?(Bishop) && p1.color == :black
#       b2 = p2.instance_of?(Bishop) && p2.color == :black
#       expect(b1 && b2).to be true
#     end
#   end

#   context 'moving pieces' do
#     it 'move A7 pawn up 2' do
#       board.move_piece([6, 0], [4, 0])
#       expect(board.spaces[4][0].instance_of?(Pawn) && board.spaces[4][0].used && board.spaces[6][0].nil?).to be true
#     end
#     it 'move b2 pawn down 2, A5 pawn claims' do
#       board.move_piece([6, 0], [4, 0])
#       board.move_piece([1, 1], [3, 1])
#       board.move_piece([4, 0], [3, 1])
#       piece_color = board.spaces[3][1].color == :white
#       piece_type = board.spaces[3][1].instance_of?(Pawn)
#       white_capture = board.white_claimed.length == 1
#       expect(piece_color && piece_type && white_capture).to be true
#     end

#     it 'move b2 pawn down 2, A5 pawn claims' do
#       board.move_piece([6, 0], [4, 0])
#       board.move_piece([1, 1], [3, 1])
#       board.move_piece([4, 0], [3, 1])
#       board.move_piece([1, 2], [2, 2])
#       board.move_piece([3, 1], [2, 2])
#       board.move_piece([0, 1], [2, 2])
#       piece_color = board.spaces[2][2].color == :black
#       piece_type = board.spaces[2][2].instance_of?(Knight)
#       white_capture = board.white_claimed.length == 2
#       black_capture = board.black_claimed.length == 1
#       expect(piece_color && piece_type && white_capture && black_capture).to be true
#     end
#   end
# end
