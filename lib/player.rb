require_relative 'scoring'
require 'pry'

module Scrabble
  class Player
    attr_reader :name, :points

    def initialize(name)
      @name = name
      @plays = []
      @points = 0
    end

    def plays
      return @plays
    end

    def play(word)
      @plays << word
      if @points > 100
        return false
      else
        @points += Scoring.score(word)
        return Scoring.score(word)
      end
    end

  end
end
binding.pry
