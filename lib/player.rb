require_relative '../lib/scoring'

module Scrabble

  class Player
    attr_accessor :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
    end

    def total_score
    end

    def won?
    end

    def highest_scoring_word
    end

    def highest_word_score
    end
  end
end
