module Scrabble
  class Player
    attr_reader :name, :played_words
    def initialize(player_name)
      @name = player_name
      @played_words = []
    end

    def plays
      return  @played_words
    end

    def play(word)
      @played_words << word

      if won
        return false
      else
        return Scrabble::Scoring.score(word)

      end
    end
    # calculates the score of all the words
    def total_score
      word_scores = @played_words.map do |word|
        Scrabble::Scoring.score(word)
      end
      return word_scores.inject(:+)
    end

    def won
      if total_score > 100
        return true
      else
        return false

      end


    end
  end
end
