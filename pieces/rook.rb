require_relative "piece"

class Rook < Piece
    
    def symbol
        '♜'.colorize(color)
    end

    protected

    def move_dirs
    end
end