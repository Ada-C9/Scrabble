
module Scrabble

  class TileBag

    attr_accessor :tiles_in_bag, :draw_array

    def initialize(tiles_in_bag)
      @tiles_in_bag = tiles_in_bag
      @draw_array = []
    end

    def draw_tiles(num)
      random_letters = [:A, :B, :C, :D, :E, :F, :G, :H, :I, :J, :K, :L, :M, :N, :O, :P, :Q, :R, :S, :T, :U, :V, :W, :X, :Y, :Z]

      num.times do

        draw = random_letters.sample
        until
          # Until the value in @tiles_in_bag that corresponds tp the key in random_letter has a value of 1 or more, keep drawing tiles.
        end
        @draw_array << draw
      end
      end

    end

    def tiles_remaining
    end

  end

end


=begin

{
  :A => 9, :N => 6, :B => 2, :O => 8, :C => 2,
  :P => 2, :D => 4, :Q => 1, :E => 12, :R => 6,
  :F => 2, :S => 4, :G => 3, :T => 6, :H => 2,
  :U => 4, :I => 9, :V => 2, :J => 1, :W => 2,
  :K => 1, :X => 1, :L => 4, :Y => 2, :M => 2,
  :Z => 1
}



=end
