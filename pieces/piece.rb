require 'colorize'

class Piece
    attr_reader :board, :color
    attr_accessor :pos

    def initialize(color, board, pos)
        raise 'invalid color' unless %i(white black).include?(color)
        raise 'invalid pos' unless board.valid_pos?(pos)

        @color, @board, @pos = color, board, pos

        board.add_piece(self, pos)
    end

    def to_s
        " #{symbol} "
    end
    
    def empty?
        false
    end
    
    def valid_moves
    end
    
    def symbol
        # subclass implements this 
        raise NotImplementedError
    end

    private

    def move_into_check?(end_pos)
    end
end

