require 'byebug'
module Slideable
    # attr_reader :HORIZONTAL_DIRS
    HORIZONTAL_DIRS = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    ]
    DIAGONAL_DIRS = [
        [1,1],
        [-1,-1],
        [1,-1],
        [-1,1]
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        arr = []
        self.move_dirs.each do |direction|
            arr += grow_unblocked_moves_in_dir(direction[0],direction[1])
        end
        arr
    end

    def grow_unblocked_moves_in_dir(drow,dcol)
        arr = []
        blocked = false
        current_row = self.pos[0]
        current_col = self.pos[1]
        # temp = Marshal.load(Marshal.dump(self.pos))
        while !blocked
            # debugger
            current_row += drow
            current_col += dcol
            if self.board.valid_pos?([current_row, current_col])
                #check if piece
                #add piece and then return
                if self.board[[current_row,current_col]].is_a? NullPiece
                    arr << [current_row,current_col]
                    return arr
                else
                     arr << [current_row,current_col]
                end
            else
                blocked = true
            end
        end

        arr
    end

end