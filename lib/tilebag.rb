require 'awesome_print'

module Scrabble
  class TileBag
    attr_reader :tile_bag

    def initialize
      @tile_bag =
      { A: ['A']*9,
        B: ['B']*2,
        C: ['C']*2,
        D: ['D']*4,
        E: ['E']*12,
        F: ['F']*2,
        G: ['G']*3,
        H: ['H']*2,
        I: ['I']*9,
        J: ['J']*1,
        K: ['K']*1,
        L: ['L']*4,
        M: ['M']*2,
        N: ['N']*6,
        O: ['O']*8,
        P: ['P']*2,
        Q: ['Q']*1,
        R: ['R']*6,
        S: ['S']*4,
        T: ['T']*6,
        U: ['U']*4,
        V: ['V']*2,
        W: ['W']*2,
        X: ['X']*1,
        Y: ['Y']*2,
        Z: ['Z']*1 }
      end

      # Returns a collection of random tiles, removes the tiles from the default set or returns an empty array and displays a message to the user.
      def draw_tiles(num)
        random_tiles = []
        if num <= tiles_remaining && num > 1
          num.times do
            count = 0
            random_number = rand(0...tiles_remaining)
            @tile_bag.map{|letter_type,letter|
              letter.each do |single_letter|
                if count == random_number
                  random_tiles << single_letter
                  letter.pop
                end
                count+=1
              end}
            end
          else
            puts "There are not enough tiles"
          end
          return random_tiles
        end

        # Returns the number of tiles remaining in the bag
        def tiles_remaining
          tiles_remaining = @tile_bag.sum{|letter_type,character| character.length}
          return tiles_remaining
        end
      end
    end
