# Each player has a hand, plus a pot
# Player has methods to ask the user:
# Which cards they wish to discard
# Whether they wish to fold, see, or raise.

class Player
    def initialize(name,hand)
        @hand = hand
        @name = name
        @money = 100
        @is_playing? = true
    end

    def discard_cards
        
        
        begin
            puts "Input up to 3 indexes for cards to discard"
            input = gets.chomp
            raise "TOO MANY CARDS DUDE" if input > 3
        rescue
            "you chose too many cards"
            retry
        end
        return input
    end


    def action(bet)
        puts "'F' for Fold, 'R $'for Raise, 'S' for See"
        input = gets.chomp

        if input == 'F'
            @is_playing? = false
            return 0
        elsif input == 'S'
            money -= bet
            return bet
        else
            #have some checker to see if input is in correct format
            raise_amt = input[2..-1]
            money -= raise_amt
            return raise_amt
        end
    end
end