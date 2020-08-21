module Stepable

    def possible_moves
        arr = []
        p self
            self.move_diffs.each do |move|
                temp = []
                temp[0] = self.pos[0] + move[0]
                temp[1] = self.pos[1] + move[1]
                # board.valid_pos(temp)
                arr << temp if self.board.valid_pos?(temp) 
                #come back when you create valid_pos method inside of board class
                # possible_moves << temp  
            end
        arr
    end

end