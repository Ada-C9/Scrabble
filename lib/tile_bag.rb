#***********************************************************
# Class TileBag in Scrabble Module:

module Scrabble
  class TileBag

    attr_reader :bag

    def initialize(tile_bag_hash)
      @bag =  tile_bag_hash
    end

    # _________________DRAW TILES METHOD____________________
    # Accepts a number of tiles that needs to be drawn for the player and creates a loop that will:
    # - take a random letter from the bag
    # - add this letter to the array of tiles
    # - subtract the quantity of that letter available in the tile bag
    # - delete the key of this letter from the tile bag if there are none available anymore.

    def draw_tiles(num)
      tiles_drawn = [ ]

      num.times do
        new_letter = @bag.keys.sample
        tiles_drawn << new_letter
        @bag[new_letter] -= 1
        @bag.delete_if { |letter, quantity| quantity == 0 }
      end

      return tiles_drawn
    end

    # _______________TILES REMAINING METHOD_________________
    # Returns the total quantity of tiles still available in the tile bag.

    def tiles_remaining
      return @bag.values.sum
    end

  end
end
