# frozen_string_literal: false

# knight travails class
class KnightsTravails
  def initialize
    @possible_moves = [[1, 2], [2, 1], [2, -1], [1, -2],
                       [-1, -2], [-2, -1], [-2, 1], [-1, 2]]
    @visited = []
    @queue = []
  end

  def knight_moves(start, stop)
    @queue.append([start])
    @visited.append(start)
    while @queue.length.positive?
      q_len = @queue.length

      (0..q_len).each do |_i|
        current = @queue.shift
        return current if current[-1] == stop

        populate_q(current)
      end
    end
  end

  def populate_q(current)
    this = current[-1]
    @possible_moves.each do |m|
      moved = make_move(this, m)
      add_move(current, moved) if validate_move(moved) == true
    end
  end

  def add_move(current, moved)
    new_list = current.map(&:clone)
    new_list.append(moved)
    @visited.append(moved)
    @queue.append(new_list)
  end

  def make_move(start, move)
    x = start[0] + move[0]
    y = start[1] + move[1]
    [x, y]
  end

  def validate_move(move)
    return false if @visited.include?(move)
    return true if move[0].between?(0, 7) && move[1].between?(0, 7)

    false
  end
end

knight = KnightsTravails.new
p knight.knight_moves([7, 7], [7, 3])

knight2 = KnightsTravails.new
p knight2.knight_moves([0, 0], [3, 3])

knight3 = KnightsTravails.new
p knight3.knight_moves([3, 3], [0, 0])
