# require_relative - which file?
require 'pry'

module Scrabble
  class TileBag
    attr_reader :tiles

    DEFAULT_TILES = {
      "a" => 9,
      "b" => 2,
      "c" => 2,
      "d" => 4
    }

    def initialize
      @tiles = []
      DEFAULT_TILES.each do |letter, count|
        count.times {@tiles << letter}
      end
    end

    def draw_tiles(num)
      # You need to be able to shuffle default tilebag and push 7 letters into
      # the array


      @titles.shuffle

      player_array = []
      player_array << @titles(0)



    end

    def tiles_remaining
    end
  end
end
