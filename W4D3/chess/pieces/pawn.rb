require_relative '../piece'
class Pawn < Piece
    attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = :pawn
    end
    def move_diffs
        # king_moves = [
        #     [1,0],
        #     [1,1],
        #     [0,1],
        #     [-1,0],
        #     [-1,-1], 
        #     [0,-1],
        #     [1,-1],
        #     [-1,1]
        # ]
    end
end