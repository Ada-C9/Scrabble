module Scrabble
  class TileBag
    attr_accessor :tile_bag

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

    def draw_tiles(num)

      drawn_tiles = @tile_bag.to_a.sample(num)

      drawn_tiles.each do |letter_frequency|
        # print letter_frequency[0]
        @tile_bag[letter_frequency[0]] -=1
      end
      return drawn_tiles
    end

    def tiles_remaining
      @tile_bag.inject(0) do |sum, (letter, frequency)|
        sum + frequency
      end
    end
  end
end
