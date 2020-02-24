require_relative 'board'
require_relative 'humanplayer'

class Game
    attr_reader :board, :display, :curr_player, :players

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @players = {
            white: HumanPlayer.new(:white, @display),
            black: HumanPlayer.new(:black, @display)
        }
        @curr_player = :white
    end

    def play
        until board.checkmate?(curr_player)
            begin
                start_pos, end_pos = players[curr_player].make_move(board)
                board.move_piece(curr_player, start_pos, end_pos)

                swap_turn!
            rescue => exception
                @display.notifications[:error] = exception.message
                retry
            end
        end

        display.render
        puts "#{curr_player} is in checkmate."
        nil
    end

    def inspect
        display.render.inspect
    end

    private

    def notify_players
    end

    def swap_turn!
        @curr_player = curr_player == :white ? :black : :white
    end
end