require_relative 'display'
require_relative 'player'

class HumanPlayer < Player

    def make_move(_board)
        start_pos, end_pos = nil, nil

        until start_pos && end_pos
            display.render

            if start_pos == nil
                puts "#{color}'s turn. Move FROM where?"
                start_pos = display.cursor.get_input

                display.reset! if start_pos
            else
                puts "#{color}'s turn. Move TO where?"
                end_pos = display.cursor.get_input

                display.reset! if end_pos
            end
        end

        [start_pos, end_pos]
    end

end