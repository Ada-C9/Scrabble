<<<<<<< HEAD
# require_relative - which file?
=======
require_relative './scoring'
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
require 'pry'

module Scrabble
  class TileBag
<<<<<<< HEAD
    attr_reader :tiles

    DEFAULT_TILES = {
      "a" => 9,
      "b" => 2,
      "c" => 2,
      "d" => 4
    }
=======

    attr_reader :tiles

    DEFAULT_TILES = {
      "a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12,
      "f" => 2, "g" => 3, "h" => 2, "i" => 9, "j" => 1,
      "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8,
      "p" => 2, "q" => 1, "r" => 6, "s" => 4, "t" => 6,
      "u" => 4, "v" => 2, "w" => 2, "x" => 1, "y" => 2, "z" => 1
      }

>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57

    def initialize
      @tiles = []
      DEFAULT_TILES.each do |letter, count|
        count.times {@tiles << letter}
      end
    end

    def draw_tiles(num)
<<<<<<< HEAD
      # You need to be able to shuffle default tilebag and push 7 letters into
      # the array


      @titles.shuffle

      player_array = []
      player_array << @titles(0)


=======
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57

    end

    def tiles_remaining
<<<<<<< HEAD
=======

>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
    end
  end
end
