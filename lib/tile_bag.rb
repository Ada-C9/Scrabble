

module Scrabble
  class TileBag

    attr_reader :bag, :tiles_drawn

    def initialize(tile_bag_hash)
      @bag =  tile_bag_hash
      @tiles_drawn = []

    end

    def draw_tiles(num)
      while @tiles_drawn.length != num
        new_letter = @bag.keys.sample
        if @bag[new_letter] > 0
          @tiles_drawn << new_letter
          @bag[new_letter] -= 1
        end
      end
      return @tiles_drawn
    end

    def tiles_remaining
      return @bag.values.sum
    end

  end
end

# tile_bag = Scrabble::TileBag.new({"a" => 1, "b" => 2, "c" => 3})
#
# tile_bag.draw_tiles(3)
