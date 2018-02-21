require 'pry'
require_relative 'scoring'
module Scrabble
  class Player
    attr_accessor :name, :plays, :total_score
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end

    def play(word)
      @plays << word
      if won?
        return false
      else
        score = Scrabble::Scoring.score(word)
        @total_score += score
        return score
        return
      end
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
      if total_score > 100
        return true
      else
        return false
      end


      # result = total_score > 100 ? true : false
      # return result
    end

  end # Player class end
end # Scrabble end
binding.pry
