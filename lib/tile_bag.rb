require 'pry'
require_relative 'scoring.rb'
require 'awesome_print'

module Scrabble
  class TileBag
    attr_accessor :tile, :tile_bag, :number_of_tiles

    def initialize
      @tile_bag =
      [
        {"A" => 9},
        {"B" => 2},
        {"C" => 2},
        {"N" => 6},
        {"O" => 8},
        {"P" => 2},
        {"D" => 4},
        {"Q" => 1},
        {"E" => 12},
        {"R" => 6},
        {"F" => 2},
        {"S" => 4},
        {"G" => 3},
        {"T" => 6},
        {"H" => 2},
        {"U" => 4},
        {"I" => 9},
        {"V" => 2},
        {"J" => 1},
        {"W" => 2},
        {"K" => 1},
        {"X" => 1},
        {"L" => 4},
        {"Y" => 2},
        {"M" => 2},
        {"Z" => 1},
      ]
      @number_of_tiles = 7
    end

    def draw_tiles(num)
      drawn_tiles = []
      num.times do
        drawn_tiles.push(@tile_bag.sample)

      end
      return drawn_tiles

    end

    def tiles_remaining
    end

  end
end
