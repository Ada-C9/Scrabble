module Scrabble
  class TileBag

    attr_accessor :letters

    def initialize
      @letters = {
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
      # Return a new array of all the Values from the Hash
      tile_bag = []
      letter_array = letters.to_a
      random_num = rand(26)
      num.times do
        letter_array[random_num]
        while letter_array[random_num][1] > 0
          tile_bag << letter_array[random_num][0]
          letter_array[random_num][1] -= 1
        end
      end
      return tile_bag
    end
  end
end

new_tiles = Scrabble::TileBag.new
print new_tiles.draw_tiles(4)
