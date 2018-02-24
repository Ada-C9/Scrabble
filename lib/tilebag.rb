require 'pry'
require_relative 'scoring.rb'
require_relative 'player.rb'

module Scrabble
  class TileBag
    attr_reader :default_tiles, :tiles_remaining

    def initialize
<<<<<<< HEAD
      @default_tiles = {"A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1}
      @tiles_remaining =
    end

    def draw_tiles(num)
      # returns a collection of random tiles
      # removes the tiles from default_tiles
=======

      @default_tiles = {"A" => 9,
        "B" => 2, "C" => 2,
        "D" => 4, "E" => 12, "F" => 2,
        "G" => 3, "H" => 2, "I" => 9,
        "J" => 1, "K" => 1, "L" => 4,
        "M" => 2, "N" => 6, "O" => 8,
        "P" => 2, "Q" => 1, "R" => 6,
        "S" => 4, "T" => 6, "U" => 4,
        "V" => 2, "W" => 2, "X" => 1,
        "Y" => 2, "Z" => 1}
    end
>>>>>>> 64800b28c87c332d7702a6d629328c3ae4ec9117

      def draw_tiles(num)
        num.times do
          @drawn_tiles = []
          letter = @default_tiles.keys.sample
          @default_tiles[letter] -= 1
          @default_tiles.delete_if {|ltr, qty| qty == 0}
          @drawn_tiles << letter[0]
        end
        return @drawn_tiles
      end

      def tiles_remaining
        @tiles_remaining = @default_tiles.values.inject(:+)
      end
  end
end
