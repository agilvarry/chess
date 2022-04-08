# frozen_string_literal: false

# knight travails class
class KnightsTravails
  def initialize
    @possible_moves = [[2, 1]] # , [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, -2], [1, -2]].freeze
    @best_moves = []
  end

  def knight_moves(start, stop, moves = [start])
    if start == stop && moves.length < @best_moves.length
      @best_moves = moves 
        return
    end
    @possible_moves.each do |move|
      new_loc = make_move(start, move)
      next if validate_move(new_loc) == false

      moves.append(new_loc)
      knight_moves(new_loc, stop, moves)
    end
    @best_moves
  end

  def make_move(start, move)
    x = start[0] + move[0]
    y = start[1] + move[1]
    [x, y]
  end

  def validate_move(move)
    if move[0].negative? || move[1] > 7 || move[0] > 7 || move[1].negative?
        return false
    end
    
    true
  end
end

knight = KnightsTravails.new
p knight.knight_moves([0, 0], [1, 2])
