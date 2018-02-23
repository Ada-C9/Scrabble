require_relative 'scoring'

module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      if self.won?
        return false
      else
        @plays << word
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      total_score = @plays.map do |word|
        Scrabble::Scoring.score(word)
      end.sum
      return total_score
    end

    def won?
      if self.total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      @plays.max_by do |word|
        Scrabble::Scoring.score(word)
      end

    end

    def highest_word_score
      if @plays.length == 0
        return 0
      else
        word = self.highest_scoring_word
        score = Scrabble::Scoring.score(word)
        return score
      end
    end

  end # Player Class

end # Scrabble Module
