# require 'pry'

module Scrabble
  class TileBag

    attr_reader :initial_bag, :tiles_remaining

    def initialize
      @initial_bag = []
      @tiles_remaining = 0
      build_initial_bag
    end

    def draw_tiles(num)
      return if !num.between?(1, MAX_LETTERS) || @tiles_remaining == 0
      tiles = []
      while tiles.size < num
        tiles << @initial_bag.slice!(rand(0...@initial_bag.size))
      end
      @tiles_remaining -= num
      return tiles
    end

    private

    def build_initial_bag
      initial_hash = { # TODO: change to use a CSV?
        "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
        "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6,
        "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4,
        "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
      }

      initial_hash.each do | letter, quantity |
        quantity.times do
          @initial_bag << letter
        end
      end
      @tiles_remaining = @initial_bag.size
    end

  end
end
