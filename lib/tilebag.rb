require_relative "../lib/player"
require_relative "../lib/scoring"
require 'pry'

original_tile_bag = {
  :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
  :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
  :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
  :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
  :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
  :Z => 1
}

module Scrabble

  class TileBag

    attr_accessor :tiles_in_bag, :draw_array

    def initialize(original_tile_bag)
      # We decided to pass in the original_tile_bag as a parameter instead of calling .dup to make a local copy of the original
      @tiles_in_bag = original_tile_bag
      # @draw_array = []
    end

    def draw_tiles(num)
      random_letters = [:A, :B, :C, :D, :E, :F, :G, :H, :I, :J, :K, :L, :M, :N, :O, :P, :Q, :R, :S, :T, :U, :V, :W, :X, :Y, :Z]
      draw_array = []
      num.times do
        successful_draw = nil
        # Until the value in @tiles_in_bag that corresponds tp the key in random_letter has a value of 1 or more, keep drawing tiles.
        while successful_draw == nil
          draw = random_letters.sample
          # binding.pry
          if @tiles_in_bag[draw] >= 1
            @tiles_in_bag[draw] -= 1
            successful_draw = draw
            draw_array << successful_draw
          end
        end
      end
      return draw_array
    end

    def tiles_remaining
      tile_count = @tiles_in_bag.values.inject { |a, b| a + b }
      return tile_count
    end

  end

end

# new_bag = Scrabble::TileBag.new(original_tile_bag)
# new_bag.draw_tiles(1)
