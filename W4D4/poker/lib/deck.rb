require_relative 'card'
class Deck
    SUITS = ["spade", "clover", "heart", "diamond"]
    VALUES =["2","3","4","5","6","7",'8',"9","10","J","Q","K","A"]

    attr_reader :cards
    def initialize
        @cards = []
        SUITS.each do |suit|
            VALUES.each do |value|
                cards << Card.new(suit,value)
            end
        end
    end

end


deck = Deck.new

deck.cards.each do |card|
    p "#{card.value} #{card.suit } "

end

p deck.cards.length