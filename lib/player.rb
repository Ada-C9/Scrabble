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


  end

end
