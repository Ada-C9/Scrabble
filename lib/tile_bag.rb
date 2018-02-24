require 'pry'
require_relative 'scoring.rb'
require 'awesome_print'

module Scrabble
  class TileBag
    attr_reader :tile_bag

    def initialize
      @tile_bag =
      {
        "A" => 9,
        "B" => 2,
        "C" => 2,
        "N" => 6,
        "O" => 8,
        "P" => 2,
        "D" => 4,
        "Q" => 1,
        "E" => 12,
        "R" => 6,
        "F" => 2,
        "S" => 4,
        "G" => 3,
        "T" => 6,
        "H" => 2,
        "U" => 4,
        "I" => 9,
        "V" => 2,
        "J" => 1,
        "W" => 2,
        "K" => 1,
        "X" => 1,
        "L" => 4,
        "Y" => 2,
        "M" => 2,
        "Z" => 1,
      }
      # [
      #   {"A" => 9},
      #   {"B" => 2},
      #   {"C" => 2},
      #   {"N" => 6},
      #   {"O" => 8},
      #   {"P" => 2},
      #   {"D" => 4},
      #   {"Q" => 1},
      #   {"E" => 12},
      #   {"R" => 6},
      #   {"F" => 2},
      #   {"S" => 4},
      #   {"G" => 3},
      #   {"T" => 6},
      #   {"H" => 2},
      #   {"U" => 4},
      #   {"I" => 9},
      #   {"V" => 2},
      #   {"J" => 1},
      #   {"W" => 2},
      #   {"K" => 1},
      #   {"X" => 1},
      #   {"L" => 4},
      #   {"Y" => 2},
      #   {"M" => 2},
      #   {"Z" => 1},
      # ]
      # @tile_bag = {
      #   "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
      #   "D" => 2, "G" => 2,
      #   "B" => 3, "C" => 3, "M" => 3, "P" => 3,
      #   "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
      #   "K" => 5, "J" => 8, "X" => 8,
      #   "Q" => 10, "Z" => 10
      # }

    end

    def draw_tiles(num)
      drawn_tiles = []

      num.times do
      drawn_tiles.push(@tile_bag.keys.sample)
      end

      drawn_tiles.each do |tile|
        remove_tile_from_bag(tile)
      end

      return drawn_tiles
    end

    def remove_tile_from_bag(letter)
      @tile_bag[letter] -= 1
    end

    def tiles_remaining
      @tile_bag.values.sum
    end

  end
end
