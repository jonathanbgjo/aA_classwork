require "byebug"
require "set"
require_relative "./player.rb"
class Game
    attr_accessor :current_player, :previous_player, :player_1, :player_2, :fragment
    attr_reader :dictionary
    if __FILE__ == $PROGRAM_NAME
        # print "hi"
    end
    # puts __FILE__
    # puts $PROGRAM_NAME

    def initialize
        # @players = []
        @player_1 = Player.new("a")
        @player_2 = Player.new('b')
        @fragment = ""

        file_contents_array = File.open("./dictionary.txt").readlines.map(&:chomp) 
        @dictionary = Set.new(file_contents_array)

        @current_player = @player_1
        @previous_player = nil
    end

    def next_player!
        @previous_player = @current_player
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def take_turn(player)
        string = player.get_string

        if valid_play?(string)
            @fragment += string
            @dictionary.each do |word|
                if word.start_with?(@fragment)
                    next_player!
                end
            end
            @fragment = @fragment[0..-2]

        end
    end
    def valid_play?(string)

    end
end
# "zebra"

# 'always'
# 'a'

# def my_flatten
#             ans = []
#             self.each do |ele| #2
#                 # ans << ele
#                 if !ele.is_a?(Array)
#                     ans << ele
#                 else
#                     ans += ele.my_flatten
#                 end
#             end
#             ans
#         end