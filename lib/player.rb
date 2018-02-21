module Scrabble
  class Player
    attr_accessor :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word
      if won?
        return false
      else
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      #  Returns the sum of scores of played words
    end

    def highest_scoring_word
      # Returns the highest scoring played word
    end

    def highest_word_score
      # Returns the highest_scoring_word score
    end

    private
    def won?
      # If the player has over 100 points, returns true, otherwise returns false
    end

  end # Player class end
end # Scrabble end
