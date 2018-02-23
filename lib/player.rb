module Scrabble
  class Player
    attr_reader :name
    def initialize(player_name)
      @name = player_name
      @played_words = []
    end

    def plays
      return  @played_words
    end
    def play(word)
      @played_words << word
      if @name.won?
        return false
      else
        return Scrabble::Scoring.score(word)
      end
      return word
    end

    def won?(total_score)

    end
  end
end
