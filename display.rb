require 'colorize'
require_relative "cursor"

class Display

    attr_reader :board, :cursor, :notifications

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
        @notifications = Hash.new
    end

    def colors_for(i, j)
        if cursor.cursor_pos == [i,j] && cursor.selected
            bg = :red
        elsif cursor.cursor_pos == [i,j]
            bg = :light_green
        elsif (i+j).odd?
            bg = :light_blue
        else
            bg = :light_yellow
        end
        {background: bg}
    end

    def build_grid
        @board.rows.map.with_index do |row, idx|
            build_row(row, idx)
        end
    end

    def build_row(row, i)
        row.map.with_index do |piece, j|
            color_options = colors_for(i,j)
            piece.to_s.colorize(color_options)
        end
    end

    def render
        system ("clear")
        puts "Arrow keys, WASD, or vim to move, space or enter to confirm"
        build_grid.each { |row| puts row.join}
    end

end