require_relative '../lib/scoring'
require_relative '../lib/player'
require 'pry'
require "awesome_print"

module Scrabble
  class TileBag
    attr_accessor :starting_tiles, :hand_of_tiles, :remaining_tiles

    def initialize

      @starting_tiles = {
        A: 9, B: 2, C: 2, D: 4, E: 12, F: 2,
        G: 3, H: 2, I: 9, J: 1, K: 1, L: 4,
        M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4,
        T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1
      }

      @remaining_tiles = []
      @starting_tiles.each do |letter,value|
        value.times do
          @remaining_tiles.push(letter.to_s)
        end
      end

      @remaining_tiles = @remaining_tiles.shuffle

    end

    def draw_tiles(number)
       return @remaining_tiles.shift(number)
    end

    def tiles_remaining
       return @remaining_tiles.length
    end

  end
end


first = Scrabble::TileBag.new
ap first.draw_tiles(1)
