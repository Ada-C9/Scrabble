module Scrabble
  class Tilebag

    attr_reader :tile_bag

    BAG = { A: 9,	N: 6, B: 2,	O: 8, C: 2, P: 2, D: 4,	Q: 1, E: 12, R: 6, F: 2,	S: 4, G: 3, T: 6, H: 2,	U: 4, I: 9,	V: 2, J: 1,	W: 2, K: 1,	X: 1, L: 4,	Y:2, M: 2,	Z: 1 }

    def initialize
      #creates array which takes (letter, value) as index & tilebag as iterator
      @tile_bag = BAG.each_with_object([]) { |(letter, value),tile_bag|
      #iterate through the letters val times and shovel the
      #letter to the individual letter tilebag
        value.times { (tile_bag << letter.to_s)}} #
      end

      puts "#{@tile_bag}"

      def draw_tiles(num)

        players_tiles = []

        num.times do
          random_number = rand(0...tile_bag.length)

          new_tile = tile_bag.delete_at(random_number)
          if new_tile == nil
            puts "No more tiles! "
          else players_tiles << new_tile
          end
        end # times

        return players_tiles

      end  # draw_tiles
    end # class # Tilebag
  end # module Scrabble


  # x = Scrabble::Tilebag.new
  # puts x.draw_tiles(3)
