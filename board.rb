require_relative "pieces"


class Board
    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        populate_board(fill_board)
    end

    def [](pos)
        @rows[pos]
    end

    def []=(pos, val)
    end

    def move_piece(color, start_pos, end_pos)
    end

    def valid_pos?(pos)
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

    def populate_board
        # populate a default 8x8 chess board grid
        @rows = Array.new(8){Array.new(8, sentinel)}
    end
end