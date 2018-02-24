require 'awesome_print'
require 'pry'

require_relative 'scoring'



module Scrabble
  class TileBag
    attr_reader :tiles

    DEFAULT_TILES = {
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

    # this code is DRY and less code then to write out each letter and value
    def initialize
      @tiles = []
      DEFAULT_TILES.each do |letter, count|
        count.times {@tiles << letter}
      end
    end

    def draw_tiles(num)
      tile_bag_count = 98
      player_tiles = []
      num.times do
        tile_index = rand(0..tile_bag_count-1)
        selected_tile = @tiles[tiles_index]
        player_tiles << selected_tile
        @tiles.delete_at(tile_index)
      end
      return player_tiles
    end

    def tiles_remaining

    end
  end
end
