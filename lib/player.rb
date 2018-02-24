require 'pry'
require_relative '../lib/scoring'

module Scrabble
  class Player
    attr_accessor :name

    def initialize(name)
      @name = name
      @plays = []
    end # initialize

    def plays
      return @plays
    end

    def play(word)
      if won?
        return false
      else
        @plays << word
        return Scrabble::Scoring.score(word)
      end
    end

    def won?
      if total_score >= 100
        return true
      else
        return false
      end
    end

    def total_score
      points = 0
      @plays.each do |word|
        word_score = Scrabble::Scoring.score(word)
        points += word_score
      end
      return points
    end

  end # class player

end # module
# player = Scrabble::Player.new("Sam")
# player.play("word")
# player.play("dog")
# puts player.total_score
