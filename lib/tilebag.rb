# require 'pry'

module Scrabble
  class TileBag

    attr_reader :initial_bag, :tiles_remaining

    def initialize
      @initial_bag = {
        "A" => 9,
        "B" => 2,
        "C" => 2,
        "D" => 4,
        "E" => 12,
        "F" => 2,
        "N" => 6,
        "O" => 8,
        "P" => 2,
        "Q" => 1,
        "R" => 6,
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
        "Z" => 1
      }
      @tiles_remaining = 98
    end

    def draw_tiles(num)
      return if !num.between?(1, MAX_LETTERS)
      return if tiles_remaining == 0
      tiles = []
      while tiles.size < num
        letter = rand(65..90).chr
        redo if @initial_bag[letter] == 0
        tiles << letter
        @initial_bag[letter] -= 1
      end
      @tiles_remaining -= num
      return tiles
    end


  end
end
