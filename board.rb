require_relative "piece"


class Board
    def initialize
        @grid = populate_board
    end

    def [](pos)
    end

    def []=(pos, val)
    end

    def move_piece(color, start_pos, end_pos)
    end

    def valid_pos?(pos)
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
    end
end