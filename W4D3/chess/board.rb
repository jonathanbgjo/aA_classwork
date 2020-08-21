# Your Board class should hold a 2-dimensional array (an array of arrays). 
# Each position in the board either holds a moving Piece or a NullPiece 
# (NullPiece will inherit from Piece).
require_relative 'piece'
require_relative './pieces/king'
require_relative './pieces/NullPiece'
require_relative './pieces/knight'
require_relative './pieces/rook'
require_relative './pieces/queen'
require_relative './pieces/bishop'
require_relative './pieces/pawn'
class Board
    attr_reader :grid
    def self.make_grid
        arr = Array.new(8){Array.new(8){NullPiece.instance} }
    end    
    
    def initialize
        @grid = Board.make_grid
    end  
    
    def [](pos) #pos = [1,2]
        #board[x][y]
        return self.grid[pos[0]][pos[1]]
    end    

    def []=(pos, piece)
        self.grid[pos[0]][pos[1]] = piece
    end

    def move_piece(start_pos, end_pos)
        raise "no piece" if self[start_pos].nil?

        raise error if  !self[start_pos].move_diffs.include?(end_pos) 

        self[end_pos] = self[start_pos]
        #once we have null piece, make nil = null piece
        self[start_pos] = Piece.new(nil)
    end

    def valid_pos?(pos)
        if (pos[0] >= 0 && pos[0] <= 7 ) && (pos[1] >= 0 && pos[1] <= 7 )
            #later come back to see if we can eat this enemy piece
            # if self[pos].nil? 
            #     return true
            # end
            return true
        end

        return false
    end

    def add_piece(piece, pos)

    end

end    


# p board
# pos = [3,3]
# end_pos = [1,1]

# board.move_piece(pos, end_pos)

# p board

# king = King.new(:white, board, pos)

# p king

# p king.move_diffs

# knight = Knight.new(:white, board, pos)
# p knight
# p knight.move_diffs
board = Board.new

white_queen = Queen.new(:white, board, [0,4])
white_king = King.new(:white, board, [0,3])
white_knight = Knight.new(:white, board, [0,1])
white_knight2 = Knight.new(:white, board, [0,6])
white_bishop = Bishop.new(:white, board, [0,5])
white_bishop2 = Bishop.new(:white, board, [0,2])
white_rook = Rook.new(:white, board, [0,0])
white_rook2 = Rook.new(:white, board, [0,7])
black_queen = Queen.new(:black, board, [7,4])
black_king = King.new(:black, board, [7,3])
black_knight = Knight.new(:black, board, [7,1])
black_knight2 = Knight.new(:black, board, [7,6])
black_bishop = Bishop.new(:black, board, [7,5])
black_bishop2 = Bishop.new(:black, board, [7,2])
black_rook = Rook.new(:black, board, [7,0])
black_rook2 = Rook.new(:black, board, [7,7])
white_pawn = Pawn.new(:white, board, [1,0])
white_pawn2 = Pawn.new(:white, board, [1,1])
white_pawn3= Pawn.new(:white, board, [1,2])
white_pawn4 = Pawn.new(:white, board, [1,3])
white_pawn5 = Pawn.new(:white, board, [1,4])
white_pawn6 = Pawn.new(:white, board, [1,5])
white_pawn7 = Pawn.new(:white, board, [1,6])
white_pawn8 = Pawn.new(:white, board, [1,7])
black_pawn = Pawn.new(:black, board, [6,7])
black_pawn2 = Pawn.new(:black, board, [6,6])
black_pawn3 = Pawn.new(:black, board, [6,5])
black_pawn4 = Pawn.new(:black, board, [6,4])
black_pawn5 = Pawn.new(:black, board, [6,3])
black_pawn6 = Pawn.new(:black, board, [6,2])
black_pawn7 = Pawn.new(:black, board, [6,1])
black_pawn8 = Pawn.new(:black, board, [6,0])

p board.grid
board.grid.each do |row|
    row.each do |col|
        print "#{col.symbol}  "
    end
    p ""
end
# p rook
# p rook.moves


p white_rook.moves
p white_bishop.moves