require 'pry'

module Scrabble
  class Player

    attr_reader :name, :total_score, :plays

    def initialize(player_name)
      @name = player_name
      @player_score = 0
      @plays = []
    end

    def play(word)
      if @player_score >= 100
        return false
      end

      score = Scrabble::Scoring.score(word)

      unless score.nil?
        @plays << word
        @player_score += score
      end

      return score
    end

    def won?
        @player_score ? true : false
    end

  end
end

# won?: If the player has over 100 points, returns true, otherwise returns false
# highest_scoring_word: Returns the highest scoring played word
# highest_word_score: Returns the highest_scoring_word score
