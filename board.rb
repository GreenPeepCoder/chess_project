require_relative "pieces"


class Board

    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        populate_board
    end

    def [](pos)
        @rows[pos.first][pos.last]
    end

    def []=(pos, val)
    end

    def move_piece(color, start_pos, end_pos)
    end

    def valid_pos?(pos)
        raise error if pos.is_a?(Array) == false || pos.length != 2
        pos.all? {|coord| coord.between?(0,7)}
    end
    
    def add_piece(piece, pos)
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

    private
    attr_reader :sentinel
    
    def populate_board
        # populate a default 8x8 chess board grid
        @rows = Array.new(8){Array.new(8, sentinel)}
    end
end