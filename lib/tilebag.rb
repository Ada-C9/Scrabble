require_relative 'scoring'
require_relative 'player'

module Scrabble

  class TileBag

      attr_reader :total_tiles

      def initialize
        @total_tiles = { "a" => 1,"b" => 3,"c" => 3,"d" => 2,"e" => 1,"f" => 4,"g" => 2,"h" => 4,
          "i" => 1,"j" => 8,"k" => 5, "l" => 1,"m" => 3,"n" => 1,"o" => 1,"p" => 3,
          "q" => 10, "r" => 1, "s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4,
          "x" => 8, "y" => 4, "z" => 10 }
      end

      def draw_tiles(num)

        available = @total_tiles.select do |tile, quant|
          quant > 0
        end

        array = []

        num.times do
          selection = available.keys.sample

          until @total_tiles[selection] > 0
            selection = available.keys.sample
          end

          @total_tiles[selection] -= 1
          array << selection
        end

        return array
      end


  end # TileBag Class

end # Scrabble Module
