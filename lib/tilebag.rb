require_relative 'scoring'
require_relative 'player'

module Scrabble

  class TileBag

    attr_reader :total_tiles

    def initialize
      @total_tiles = { "a" => 9,"b" => 2,"c" => 2,"d" => 4,"e" => 12,"f" => 2,"g" => 3,"h" => 2, "i" => 9,"j" => 1,"k" => 1, "l" => 4,"m" => 2,"n" => 6,"o" => 8,"p" => 2, "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1, "y" => 2, "z" => 1 }
    end

    def draw_tiles(num)

      available = @total_tiles.select do |tile, quant|
        quant > 0
      end

      array = []

      if num > self.tiles_remaining
        num = 0
        raise ArgumentError.new("There aren't enough tiles in the bag.")
      else
        num.times do
          selection = available.keys.sample

          until @total_tiles[selection] > 0
            selection = available.keys.sample
          end

          @total_tiles[selection] -= 1
          array << selection
        end
      end

      return array
    end

    def tiles_remaining
      @total_tiles.values.sum
    end


  end # TileBag Class

end # Scrabble Module
