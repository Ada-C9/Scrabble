# require_relative '../lib/player'
# require_relative '../lib/scoring'

require 'pry'

module Scrabble
  class TileBag

    attr_accessor :tiles_remaining, :tile_bag

  def initialize
    @tiles_remaining = 98

    @tile_bag = {
      "A" => 9,
      "B" => 2,
      "C" => 2,
      "D" => 4,
      "E" => 12,
      "F" => 2,
      "G" => 3,
      "H" => 2,
      "I" => 9,
      "J" => 1,
      "K" => 1,
      "L" => 4,
      "M" => 2,
      "N" => 6,
      "O" => 8,
      "P" => 2,
      "Q" => 1,
      "R" => 6,
      "S" => 4,
      "T" => 6,
      "U" => 4,
      "V" => 2,
      "W" => 2,
      "X" => 1,
      "Y" => 2,
      "Z" => 1
    }
  end # end of initialize


  def draw_tiles(num)

    current_draw = []

    num.times do
    letter = @tile_bag.keys.sample

    while @tile_bag[letter] == 0
      letter = @tile_bag.keys.sample
    end

     current_draw << letter
     @tiles_remaining -= 1

    @tile_bag[letter] = @tile_bag[letter] - 1
    #binding.pry
    end

    return current_draw

  end

  end # end of class
end # end of module
