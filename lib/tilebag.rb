require_relative './scoring'
require 'pry'

module Scrabble
  class TileBag

    attr_reader :tiles

    DEFAULT_TILES = {
      "a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12,
      "f" => 2, "g" => 3, "h" => 2, "i" => 9, "j" => 1,
      "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8,
      "p" => 2, "q" => 1, "r" => 6, "s" => 4, "t" => 6,
      "u" => 4, "v" => 2, "w" => 2, "x" => 1, "y" => 2, "z" => 1
      }


    def initialize
      @tiles = []
      DEFAULT_TILES.each do |letter, count|
        count.times {@tiles << letter}
      end
    end

    def draw_tiles(num)
      if num > @tiles.length
        raise ArgumentError.new("Only #{num} tiles left.")
      end
      tiles_collection = []
      @tiles = @tiles.shuffle
      num.times do
        tiles_collection << @tiles.pop
      end
      return tiles_collection
    end

    def tiles_remaining
      return @tiles.length
    end
  end
end
