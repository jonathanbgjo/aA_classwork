class Card
    attr_accessor :status, :matched
    attr_reader :face_value

    def initialize(face_value)
        @face_value = face_value
        @status = false
        @matched = false
    end
    def match
        self.matched = true
    end
    def hide
        if self.status
            self.status = false
        end
    end

    def reveal
        if !self.status
            self.status = true
        end
    end

    def to_s
        self.face_value = self.face_value.to_s
    end

    def ==(card)
        if self.face_value == card.face_value
            @matched = true
            return true
        else 
            false
        end
    end


end