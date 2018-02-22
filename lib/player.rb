require_relative 'scoring'
module Scrabble
  class Player
    attr_reader :name , :plays

    def initialize name
      @name = name
      @plays = []
    end

    def play(word)
      return false if won?
      @plays << word
      return Scoring.score(word)
    end

    def total_score
      return @plays.map{ |word| Scoring.score(word) }.sum
    end

    def won?
      return total_score > 100
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

  end
end
