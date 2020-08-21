require 'deck'
require 'card'
describe Deck do
    
    describe "#initialize" do
    subject(:deck) {Deck.new}
        it 'should expect cards to be array of cards' do 
            deck.cards.each do |card|
                expect(card).to be_a(Card)
            end
        end
        it 'should hold 52 cards' do 
            expect(deck.cards.length).to eq(52)
        end
        
    end

end