require 'pry'

module Scrabble
POSSIBLE_LETTERS = {
  A: 9,
  N: 6,
  B: 2,
  O: 8,
  C: 2,
  P: 2,
  D: 4,
  Q: 1,
  E: 12,
  R: 6,
  F: 2,
  S: 4,
  G: 3,
  T: 6,
  H: 2,
  U: 4,
  I: 9,
  V: 2,
  J: 1,
  W: 2,
  K: 1,
  X: 1,
  L: 4,
  Y: 2,
  M: 2,
  Z: 1
}
  class TileBag

    attr_reader :all_tiles

    def initialize()
      @all_tiles = POSSIBLE_LETTERS.map { |letter, amount|
        (letter.to_s * amount).chars}.flatten
    end

    def draw_tiles(num)
      drawn_tiles = []
      num.times do
        chosen_tile = @all_tiles.sample
        @all_tiles.delete_at(@all_tiles.index chosen_tile)
        drawn_tiles << chosen_tile
      end
      return drawn_tiles
    end


  end
end
