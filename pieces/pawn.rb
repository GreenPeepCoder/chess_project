require_relative "piece"

class Pawn < Piece
    
    def symbol
        '♟'.colorize(color)
    end

    def move_dirs
    end

    private 

    def at_start_row?
    end

    def forward_dir
        # returns 1 or -1
    end

    def forward_steps
    end

    def side_attacks
    end
end