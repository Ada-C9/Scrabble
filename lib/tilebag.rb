module Scrabble
  class Tilebag

    TILE_BAG_LETTERS = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S",
      "T", "U", "V", "W", "X", "Y", "Z"]

    TILE_BAG_COUNT = [9, 2, 2, 4, 12, 2, 3, 2, 9, 1, 1, 4, 2, 6, 8, 2, 1, 6, 4, 6, 4, 2, 1, 2, 1]

      attr_reader :bag, :tiles_remaining

      def initialize
        @bag = []
        TILE_BAG_COUNT.each_with_index do |count, index|
          count.times do
            tile = TILE_BAG_LETTERS[index]
            @bag << tile
          end
        end

        @tiles_remaining = 96

      end


      def draw_tiles(num)

        if @tiles_remaining >= num
          @tiles_remaining -= num
          picked_tiles = @bag.sample(num)

          picked_tiles.each do |tile|
            @bag.delete_at(@bag.index(tile))
          end

          return picked_tiles
        end

        return nil
      end

  end
end
