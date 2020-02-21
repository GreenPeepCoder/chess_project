require 'colorize'
require "cursor.rb"
require_relative "board"

class Display

    attr_accessor :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end
end