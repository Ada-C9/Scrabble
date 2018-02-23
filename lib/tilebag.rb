require 'pry'
require_relative 'scoring.rb'
require_relative 'player.rb'

module Scrabble
  class TileBag
    attr_reader :tiles, :tiles_remaining

    def initialize

      @default_tiles = {"A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4, "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1}
      @tiles_remaining =
    end

    def draw_tiles(num)
      # returns a collection of random tiles
      # removes the tiles from default_tiles

      drawn_tiles = []
      num.times do
        letter = @default_tiles.to_a.sample(1)
        @default_tiles[letter[0][0]] -= 1
        @default_tiles.delete_if {|ltr, qty| qty == 0}
        drawn_tiles << letter[0]
      end

       final_drawn_tiles = []
       drawn_tiles.each do |array|
         final_drawn_tiles << array[0]
       end

       @tiles_remaining = @default_tiles.values.inject(:+)
       return final_drawn_tiles     end
    end
    # hash.random = player tiles
    #
    # players_tiles = [A W E S O M E]
    # # start at index 0 of players_tiles
    # # count frequency of each letter?
    # # or go letter by letter and check against hash, subtract
    # # value at the key
    # # check to see if the value "A" in players_tiles exists
    # # as a key in default_tiles?
    #
    # # if yes
    # # default_tiles[key] = value - (frequency in players_tiles)
    #
    # if the value at key "A" == 0?
    #   destroy the k/v pair in the hash.
    #
    # hash.empty? if yes - cant' draw another tile



  end
end
