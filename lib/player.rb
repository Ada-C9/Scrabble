require_relative '../lib/scoring'

module Scrabble
  class Player

    attr_reader :name, :total_score, :plays

    def initialize(name)
      # @name = player name
      @name = name
      # @plays = array of words the player has played
      @plays = []
      # @total_score = total of scores for all words played by the player
      @total_score = 0
    end

    def play(word)
      if won == true  # or just 'if won'
        return false
      end

      word_score = Scrabble::Scoring.score(word)

      @plays.push(word)
      @total_score += word_score

      return word_score
    end

    def won
      if @total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      word = highest_scoring_word
      score = Scrabble::Scoring.score(word)
      return score
    end

  end
end
