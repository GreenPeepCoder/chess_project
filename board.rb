require_relative "pieces"


class Board

    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        populate_board(fill_board)
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
    
    def fill_back_row(color)
        back_pieces = [
            Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]

        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(color, self, [i, j])
        end
    end

    def fill_pawn_row(color)
        i = color == :white ? 6 : 1
        8.times { |j| Pawn.new(color, self, [i,j])}
    end

    def populate_board(fill_board)
        # populate a default 8x8 chess board grid
        @rows = Array.new(8){Array.new(8, sentinel)}
        return unless fill_board
        possible_colors = %i(white black)
        possible_colors.each do |color|
            fill_back_row(color)
            fill_pawn_row(color)
        end
    end

end