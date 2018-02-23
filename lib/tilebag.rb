module Scrabble
  class Tilebag

    attr_reader :tile_bag

    BAG = { A: 9,	N: 6, B: 2,	O: 8, C: 2, P: 2, D: 4,	Q: 1, E: 12, R: 6, F: 2,	S: 4, G: 3, T: 6, H: 2,	U: 4, I: 9,	V: 2, J: 1,	W: 2, K: 1,	X: 1, L: 4,	Y:2, M: 2,	Z: 1 }

    def initialize
      @tile_bag = BAG.each_with_object([]) { |(letter, value),tile_bag|
      value.times { (tile_bag << letter.to_s)}}
    end

    def self.draw_tiles(num)
      start_tiles = 7

      individual_bag = []

      start_tiles.times do
        random_number = rand(0..tile_bag.length)
      end



    end  # draw_tiles

  end # class # Tilebag

end # module Scrabble

new_bag = Scrabble::Tilebag.new
puts "#{new_bag.tile_bag()}"
