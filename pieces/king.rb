require_relative "piece"
require_relative "stepable"

class King < Piece
    
    def symbol
        '♚'.colorize(color)
    end

    protected

    def move_diffs
        [
            [-1,-1],
            [-1,0],
            [-1,1],
            [0,-1],
            [0,1],
            [1,-1],
            [1,0],
            [1,1]
        ]
    end
end