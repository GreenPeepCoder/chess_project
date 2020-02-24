require_relative 'board'
require_relative 'humanplayer'

class Game

    def initialize
        @board = Board.new
        @display = Display.new(@board)

    end

    def play
    end

    private

    def notify_players
    end

    def swap_turn!
    end
end