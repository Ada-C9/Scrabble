module Scrabble
  class TileBag

    attr_accessor :letters, :tile_bag

    def initialize
      @tile_bag = []
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
      @letter_array = @letters.to_a
    end

    def draw_tiles(num)
      num.times do
        random_num = rand(26) # Choose a letter at random
        @letter_array[random_num]
        @tile_bag << @letter_array[random_num][0] #Add letter to tile bag
        @letter_array[random_num][1] -= 1  # Reduce number of tiles by 1
        if @letter_array[random_num][1] == 0 # Delete letter from list if 0 tiles left
          @letter_array.delete_at(random_num)
        end
      end
      return @tile_bag
    end

    def tiles_remaining
      letters_remaining = 0
       @letter_array.each do |letter|
        letters_remaining += letter[1]
      end
      return letters_remaining
    end
  end
end


# new_tiles = Scrabble::TileBag.new
# print new_tiles.draw_tiles(4)
# print new_tiles.tiles_remaining
