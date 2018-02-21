require_relative 'scoring'

module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def plays
      return @plays
    end

    def play(word)
      @plays << word
    end

    def total_score
      sum_of_scores = 0
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        sum_of_scores += score
      end
      return sum_of_scores
    end

  end
end
