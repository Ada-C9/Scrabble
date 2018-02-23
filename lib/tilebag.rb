require_relative '../lib/scoring'
require_relative '../lib/player'
require 'pry'
require "awesome_print"

module Scrabble
  class TileBag
    attr_accessor :starting_tiles

    def initialize
      @starting_tiles = {
        A: 9,
        B: 2,
        Y: 2,
        Z: 1
      }
      return @starting_tiles
    end


  end
end

# first = Scrabble::TileBag.new
# ap first
