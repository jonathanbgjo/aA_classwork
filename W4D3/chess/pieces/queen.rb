require_relative '../piece'
require_relative 'slideable'

class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super
        @symbol = :queen
    end

    def move_dirs
        arr = self.horizontal_dirs + self.diagonal_dirs
    end
end