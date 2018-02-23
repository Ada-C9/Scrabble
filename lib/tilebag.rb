module Scrabble
  class TileBag
    #player can see letters
    attr_reader :letter_quantity


    # Creating an instance of letter quantity to be used though class tilebag.
    def initialize
      @letters_bag_total = {A:9, B:2, C:2, D:4, E:12, F:2, G:3, H:2, I:9, J:1, K:1, L:4, M:2, N:6, O:8, P:2, Q:1, R:6, S:4, T:6, U:4, V:2, W:2, X:1, Y:2, Z:1}
    end

    # Define tiles remaining method to be used in the method for drawing the tiles.
    def tiles_remaining
      # still not sure why or how this is working. TODO: may take out later
      remainder = @letters_bag_total.inject(0) { |sum, i| sum += i[1] }
      p remainder

      return remainder
    end
    # Define draw tiles, put the tiles into array.
    def draw_tiles(num)
      player_tiles = []
      # array will return tiles to player. Needs much refactoring.
      return nil if num > tiles_remaining
      #to account for test, returns nil if more tiles are drawn than tiles remain.
      while player_tiles.length != num
        new_tile = rand(@letters_bag_total.size)
        starting_hand = 0

        @letters_bag_total.each do |letter, total_tiles|
          #Need to continue working on, this is becoming harder to read. TODO: REFACTOR!
          # if the amount of tiles drawn(starting at 0) is the same as the amount of new tiles drawn,
          if starting_hand == new_tile
            #if the condition above, and the total tiles isnt 0, add the new tile (letter), to all of the tiles (player_tiles array)
            if total_tiles != 0
              player_tiles << letter
              #Then subtract the letter from the tilebag, reducing the total amount of tiles by 1, and reducing the letter by one specifically from the letters.
              @letters_bag_total[letter] = total_tiles - 1
            else
              new_tile = rand(@letters_bag_total.size)
            end
          end
          #increases the amount of tiles had by player plus one, each time a tile is drawn
          starting_hand += 1
        end
      end
      #returns array of all tiles to player
      return player_tiles
    end

  end
end
