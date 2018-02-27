# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

module Scrabble
  class TileBag

    attr_reader :tiles_in_bag, :tiles_remaining

    def initialize
      @tiles_in_bag = [] # stores remaining tiles
      @tiles_remaining = 0 # number of tiles left in bag
      build_tiles_in_bag
    end

    # Returns 'nil' if provided num is not an Integer between 1 and MAX_LETTERS
    # (inclusive) or if there are no tiles remaining.
    # Returns provided num amount of tiles. If num is greater than the tiles
    # remaining, returns however many tiles are remaining.
    def draw_tiles(num)
      return if !is_able_to_draw_tiles?(num)
      num = @tiles_remaining if num > @tiles_remaining
      tiles = []
      while tiles.size < num
        tiles << @tiles_in_bag.slice!(rand(0...@tiles_in_bag.size))
      end
      @tiles_remaining -= num
      return tiles
    end

    private

    # Creates bag of tiles and sets tiles_remaining value.
    def build_tiles_in_bag
      initial_hash = {
        "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3,
        "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6,
        "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4,
        "V" => 2, "W" => 2, "X" => 1, "Y" => 2, "Z" => 1
      }
      initial_hash.each do | letter, quantity |
        quantity.times { @tiles_in_bag << letter }
      end
      @tiles_remaining = @tiles_in_bag.size
    end

    # Returns 'true' if provided num is an Integer, is between 1 and MAX_LETTERS,
    # and tiles_remaining is greater than 0. Otherwise, returns 'false'.
    def is_able_to_draw_tiles?(num)
      return num.class == Integer && num.between?(1, MAX_LETTERS) &&
        @tiles_remaining > 0
    end

  end
end
