class Card 
    attr_reader :suit
    attr_accessor :value
    FACE_CARD_VALUES = {"A"=>14, "K"=>13, "Q"=>12, "J" => 11}
    def initialize(suit, value)
        @suit = suit
        @value = value
        self.to_i
    end

    def to_i
        if self.value.to_i == 0 
            self.value = FACE_CARD_VALUES[self.value]
        else
            self.value.to_i
        end
    end
end

