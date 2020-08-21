require_relative '../piece'
require_relative "stepable"
class Knight < Piece
    include Stepable
     attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :knight
    end

    def move_diffs
        knight_moves = [
            [-2, -1],
            [-2,  1],
            [-1, -2],
            [-1,  2],
            [ 1, -2],
            [ 1,  2],
            [ 2, -1],
            [ 2,  1]
        ]
    end
end