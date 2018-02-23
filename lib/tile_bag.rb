

module Scrabble
  class TileBag

    attr_reader :bag

    def initialize(tile_bag_hash)
      @bag =  tile_bag_hash
      # @tiles_drawn = []

    end

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


    def tiles_remaining
      return @bag.values.sum
    end

  end
end

# tile_bag = Scrabble::TileBag.new({"a" => 1, "b" => 2, "c" => 3})
#
# tile_bag.draw_tiles(3)
