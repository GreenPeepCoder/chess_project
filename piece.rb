class Piece
    attr_reader :type
    def initialize(type)
        @type = type
    end

    def inspect
        @type.inspect
    end
end

class NullPiece < Piece
    def initialize
        super("NullPiece")
    end
end