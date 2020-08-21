class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos 
        @board[pos] = self
    end    

    def to_s
    end

    def empty?
    end

    def valid_moves
        self.move_diffs
    end

    def pos=(value)
        board[pos] = value
    end

    def symbol
        self.symbol
    end

    # private 
    def move_into_check(end_pos)
        #after we move to end_pos
        #piece.move_diff = possible moves for piece
        #check to see if piece.move_diff.include?:oppositecolor's king
    end    
end    

