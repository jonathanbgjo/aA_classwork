require_relative '../piece'
require_relative 'stepable' 
class King < Piece
    include Stepable
    attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = :king
    end
    def move_diffs
        king_moves = [
            [1,0],
            [1,1],
            [0,1],
            [-1,0],
            [-1,-1], 
            [0,-1],
            [1,-1],
            [-1,1]
        ]
    end
end

# king = King.new(:white, 'yes', [0,0])
# king = King.new

# p king.move_diffs




