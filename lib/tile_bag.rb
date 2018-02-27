#***********************************************************
# Class TileBag in Scrabble Module:

module Scrabble
  class TileBag

    attr_reader :bag

    def initialize
      @bag =
      {
        "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
        "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6,
        "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4,
        "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
      }
    end

    # _________________DRAW TILES METHOD____________________
    # Accepts a number of tiles that needs to be drawn for the player and creates a loop that will:
    # - take a random letter from the bag
    # - add this letter to the array of tiles
    # - subtract the quantity of that letter available in the tile bag
    # - delete the key of this letter from the tile bag if there are none available anymore.

    def draw_tiles(num)
      tiles_drawn = [ ]
      if tiles_remaining < num
        raise ArgumentError.new "NO"
      end

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
