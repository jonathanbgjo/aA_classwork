require_relative "./card.rb"
class Board

    attr_reader :display

    attr_accessor :render, :grid

    def initialize(dimension)
        if dimension % 2 != 0
            dimension -= 1
        end
        @grid = Array.new(dimension) { Array.new(dimension) }
        @render = Array.new(dimension) { Array.new(dimension, " ") }
        self.populate
    end

    def populate
        alpha = ('a'..'z').to_a 

        picked = Hash.new{ |h,k| h[k] =[]}
        
        self.grid.each_with_index do |row, i|
            row.each_with_index do |el, i2|
                if !el
                    letter = alpha.sample
                    if picked[letter].length == 0
                        self.grid[i][i2] = Card.new(letter)
                        picked[letter] += [i, i2]
                        placed = false
                        while placed == false
                            x = rand(0...self.grid.length)
                            y = rand(0...self.grid.length)
                            if !self.grid[x][y]
                                self.grid[x][y] = Card.new(letter)
                                placed = true
                            end
                        end
                    end
                end
            end
        end
        
        self.grid
    end

    def won?
        self.grid.all? {|row| row.all? { |el| el.matched}}
        # puts "YOU WON THE GAME!!"
    end
    
    def renderr
        system("clear")
        (0...self.grid.length).each { |i| print "  #{i}  "}
        puts
        self.render.each.with_index do |row, index|
            print index
            p row
        end
    end
    # def cheat
    #     arr = []
    #     (0...self.grid.length).each { |i| print "  #{i}  "}
    #     puts
    #     self.grid.each.with_index do |row, index|
    #         row.each.with_index do |ele, index_2|
    #             arr += ["#{ele.face_value}"]
    #         end
    #         print arr
    #         p "\n"
    #     end
    # end

    def reveal(guessed_pos) #[2,3]
        if !self.grid[guessed_pos[0]][guessed_pos[1]].status && !self.grid[guessed_pos[0]][guessed_pos[1]].matched
            @render[guessed_pos[0]][guessed_pos[1]] = @grid[guessed_pos[0]][guessed_pos[1]].face_value
            
            return self.grid[guessed_pos[0]][guessed_pos[1]]
        end
        
        
    end

end

board = Board.new(4)
p board
# puts
# board.populate
# p board
# puts
# board.renderr
# p board
# puts
# p render

# prev = 2,3
# prev = 3,4

# 1,2
# 2,4

#guessed_pos = 2,3
# not grid[2][3].matched
# flip the card over
#  getanother position 
#  compare with previous guess. card == method

#def render
    #each |Row|
    # each |col| 
    # if col.status == true
    # print col.face_Value 
    # else
    # print " "
    #end
    #print "\n" 

