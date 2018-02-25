require_relative '../lib/scoring'
require_relative '../lib/player'
require 'pry'
require "awesome_print"

module Scrabble
  class TileBag
    attr_accessor :starting_tiles, :hand_of_tiles

    def initialize

      @remaining_tiles = []
      @starting_tiles = {
        A: 9, B: 2, C: 2, D: 4, E: 12, F: 2,
        G: 3, H: 2, I: 9, J: 1, K: 1, L: 4,
        M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4,
        T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1
      }

      @starting_tiles.each do |letter,value|

        # letter.to_s
        value.times do
          @remaining_tiles.push(letters.to_s)
        end
      end

      @remaining_tiles = @remaining_tiles.shuffle

    end

    def draw_tiles(number)
       return @remaining_tiles.shift(number)
    end

    def tiles_remaining(number)

    end


      #   tile = @starting_tiles.keys.sample
      #   tile = tile.to_s
      #   @hand_of_tiles.push(tile)
      #
      #   @starting_tiles[tile.to_sym] -= 1
      # end
      # return @hand_of_tiles
    end


  end
end


first = Scrabble::TileBag.new
ap first.draw_tiles(1)
