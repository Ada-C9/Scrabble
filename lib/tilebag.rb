require 'awesome_print'
require 'pry'
require_relative 'player'

module Scrabble
  class TileBag
    attr_accessor :tilebag

    def initialize
      @tilebag = { "a" => 9, "b" => 2, "c" => 2, "d" => 4, "e" => 12, "f" => 2, "g" => 3, "h" => 2, "i" => 9, "j" => 1, "k" => 1, "l" => 4, "m" => 2, "n" => 6, "o" => 8, "p" => 2, "q" => 1, "r" => 6, "s" => 4, "t" => 6, "u" => 4, "v" => 2, "w" => 2, "x" => 1, "y" => 2, "z" => 1 }
    end

    def draw_tiles(num)
      hand = []
      num.times do
        letter = @tilebag.keys.sample
        @tilebag[letter] = @tilebag[letter] - 1
        if @tilebag[letter] < 1
          letter = @tilebag.keys.sample
        end

        hand << letter
      end
      return hand
    end

    def tiles_remaining
      return @tilebag.values.sum
    end
  end
end
