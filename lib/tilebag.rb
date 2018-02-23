require 'awesome_print'

module Scrabble
  class TileBag
    #
    attr_reader :tile_bag
    #initialize Should set up the instance with a collection of all default tiles
    def initialize
      @tile_bag = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]


    end

    # draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
    def draw_tiles(num)
      random_tiles = []
      if num <= tiles_remaining
        num.times do
          random_letter_index = rand(0..(tile_bag.length-1))
          random_tiles << @tile_bag[random_letter_index]
          @tile_bag.delete_at(random_letter_index)
        else
          puts "There's not enough tiles left."
        end
      end
      return random_tiles
    end

    #tiles_remaining returns the number of tiles remaining in the bag

    # def tiles_remaining
    #   @tile_bag.length
    # end
    #

  end
end
