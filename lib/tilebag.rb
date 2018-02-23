require 'awesome_print'

module Scrabble
  class TileBag
    #
    attr_reader :tile_bag

    def initialize
      @tile_bag = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]
    end

    def draw_tiles(num)
      random_tiles = []
      num.times do
        random_letter_index = rand(0..(tile_bag.length-1))
        random_tiles << @tile_bag[random_letter_index]
        @tile_bag[random_letter_index].delete
      end
      return random_tiles
    end


  end
end
