require_relative "piece"

class Queen < Piece
    def symbol
        '♛'.colorize(color)
    end

    protected

    def move_dirs
    end
end