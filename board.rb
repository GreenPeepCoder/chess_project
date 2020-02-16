require_relative "pieces"


class Board

    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        populate_board(fill_board)
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)
        @rows[pos.first][pos.last]
    end
    
    def []=(pos, val)
        raise 'invalid pos' unless valid_pos?(pos)
        @rows[pos.first][pos.last] = val
    end

    def move_piece(color, start_pos, end_pos)
        raise 'start position is empty' if empty?(start_pos)
        raise 'end position is empty' if empty?(end_pos)

        piece = self[start_pos]
        if piece.color != color
            raise 'You must move your own piece'
        elsif !piece.moves.include?(end_pos)
            raise 'Piece cannot move like that'
        elsif !piece.valid_moves.include?(end_pos)
            raise 'You cannot move into check'
        end

        move_piece!(start_pos, end_pos)
    end

    def valid_pos?(pos)
        raise error if pos.is_a?(Array) == false || pos.length != 2
        pos.all? {|coord| coord.between?(0,7)}
    end

    def empty?(pos)
        self[pos].empty?
    end
    
    def add_piece(piece, pos)
        raise 'position not empty' unless empty?(pos)
        self[pos] = piece
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

    def move_piece!(start_pos, end_pos)
        # all checks have already been made
        piece = self[start_pos]
        # raise 'piece cannot move like that' unless piece.moves.include?(end_pos)

        self[end_pos] = piece
        self[start_pos] = sentinel
        piece.pos = end_pos

        nil
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