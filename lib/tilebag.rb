require 'awesome_print'

module Scrabble
  class TileBag
    #
    attr_reader :tile_bag
    #initialize Should set up the instance with a collection of all default tiles
    def initialize
      @tile_bag = {
        A: 9,
        B: 2,
        C: 2,
        D: 4,
        E: 12,
        F: 2,
        G: 3,
        H: 2,
        I: 9,
        J: 1,
        K: 1,
        L: 4,
        M: 2,
        N: 6,
        O: 8,
        P: 2,
        Q: 1,
        R: 6,
        S: 4,
        T: 6,
        U: 4,
        V: 2,
        W: 2,
        X: 1,
        Y: 2,
        Z: 1
        }
    end

    # draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
    def draw_tiles(num)
      random_tiles = []
      if num <= tiles_remaining
        num.times do
          random_letter_index = rand(0..(tiles_remaining-1))
          random_tiles << @tile_bag[random_letter_index]
      #    @tile_bag.delete_at(random_letter_index)
        end
        else
          puts "There's not enough tiles left."
        end
      return random_tiles
    end

    #tiles_remaining returns the number of tiles remaining in the bag
    def tiles_remaining
      tiles_remaining = @tile_bag.sum {|k, v| v}
      return tiles_remaining
    end
    # tiles_remaining = @tile_bag.sum do |l, v|
    #   v
    # end

  end
end
