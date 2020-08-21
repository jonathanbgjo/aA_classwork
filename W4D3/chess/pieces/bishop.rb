require_relative '../piece'
require_relative 'slideable'

class Bishop < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :bishop
    end

    def move_dirs
        # self.horizontal_dirs
        self.diagonal_dirs
    end
end