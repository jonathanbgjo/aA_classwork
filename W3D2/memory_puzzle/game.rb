require_relative "./board.rb"



class Game
    
    attr_accessor :previous_guess, :previous_coordinates, :board
    def initialize(n)
        @board = Board.new(n)
        @previous_guess = nil
        @previous_coordinates = nil
        # p @board.grid
    end

    def play
        # self.board.populate
        while !self.board.won? #2,3
            self.board.renderr
            p "Guess position (ie '1 2'): "
            input = gets.chomp.split(" ")
            input[0] = input[0].to_i
            input[1] = input[1].to_i
            self.make_guess(input)

            # self.board.cheat
        end
        puts "YOU WON THE GAME!!!"
    end

    def make_guess(input)
        if !previous_guess
            self.previous_guess = self.board.reveal(input)
            self.previous_coordinates = input
        else
            
            # sleep(2)
            if !(self.previous_guess == self.board.reveal(input))
                self.board.renderr
                sleep(2)
                self.board.render[previous_coordinates[0]][previous_coordinates[1]] = " "
                self.board.render[input[0]][input[1]] = " "  
                self.board.grid[input[0]][input[1]].hide
                self.board.grid[previous_coordinates[0]][previous_coordinates[1]].hide
                puts "You suck"
                puts "--------"
            else
                self.board.grid[input[0]][input[1]].match
                self.board.grid[previous_coordinates[0]][previous_coordinates[1]].match
                puts "You got it!"
                puts "--------"
            end
                #do something to matched cards self.grid[guessed_pos[0]][guessed_pos[1]].reveal
            @previous_guess = nil
            @previous_coordinates = nil
        end
    end    

   

end

game = Game.new(5)
# game.board.renderr

game.play
# if !previous_position
#  
#     @previous_position = guessed_pos
# else
#     #@render
#     compare

#     #matched or not

#     #face down for both cards. previous = nil
# end