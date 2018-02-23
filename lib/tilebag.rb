require 'awesome_print'

module Scrabble
  class Tilebag
    attr_reader :tiles, :drawn_tiles

    def initialize
      tiles_hash = {
        "a" => 9,
        "b" => 2,
        "c" => 2,
        "d" => 4,
        "e" => 12,
        "f" => 2,
        "g" => 3,
        "h" => 2,
        "i" => 9,
        "j" => 1,
        "k" => 1,
        "l" => 4,
        "m" => 2,
        "n" => 6,
        "o" => 8,
        "p" => 2,
        "q" => 1,
        "r" => 6,
        "s" => 4,
        "t" => 6,
        "u" => 4,
        "v" => 2,
        "w" => 2,
        "x" => 1,
        "y" => 2,
        "z" => 1
      }

      @tiles = []
      tiles_hash.each do |letter, quanity|
        letters = (1..quanity).collect { letter } # creates an array of the number of letters e.g ["b","b"]

        @tiles << letters # creates an array of an array
      end
      @tiles = @tiles.flatten # makes the multidimensional array into a single array

      return @tiles
    end

    def draw_tiles(num)
      @drawn_tiles = @tiles.sample(num)
      @tiles.delete(@drawn_tiles)

      return @drawn_tiles
    end

    def tiles_remaining
     @tiles.length - @drawn_tiles.length
    end

  end
end
