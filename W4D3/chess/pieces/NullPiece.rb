require_relative '../piece'
require 'singleton'
class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol, :moves
    def initialize
        @color= :nil
        @symbol= :null   
        @moves = []
    end
end