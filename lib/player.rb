require 'pry'
require_relative '../lib/scoring'

module Scrabble
  class Player
    attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end # initialize

    def plays
      return
    end

    def play(word)

      word.score
      <<
    end

  end # class player

end # module
player = Scrabble::Player.new("Sam")
puts player.name
