require 'card'
describe Card do
    
    describe "#initialize" do
        subject(:card) {Card.new('spade', '1')}

        it "initialize card properly" do
            expect(card).to be_a(Card)
        end
        it  "initializes with suit and value" do
            expect(card.suit).to eq('spade')
            expect(card.value).to eq('1')
        end
    end

end