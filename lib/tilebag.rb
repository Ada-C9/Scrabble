require 'awesome_print'

module Scrabble
  class TileBag
    #
    attr_reader :tile_bag
    #initialize Should set up the instance with a collection of all default tiles
    def initialize
      # @tile_bag = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]

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
    # draw_tiles(num) returns a collection of random tiles, removes the tiles from the default set
    def draw_tiles(num)
      random_tiles = []
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
      # if num <= tiles_remaining
      #   num.times do
      #     random_letter_index = rand(0..())
      #     @tile_bag.sum {|letter_choice,letter|
      #
      #     }
      #     # random_letter_index = rand(0..(tile_bag.length-1))
      #     # random_tiles << @tile_bag[random_letter_index]
      #     # @tile_bag.delete_at(random_letter_index)
      #   else
      #     puts "There's not enough tiles left."
      #   end
      # end
      return random_tiles
    end

    #tiles_remaining returns the number of tiles remaining in the bag

    def tiles_remaining
       tiles_remaining = @tile_bag.sum{|letter_type,character| character.length}
       return tiles_remaining
    end


  end
end
