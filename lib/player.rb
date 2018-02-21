require 'awesome_print'

module Scrabble
  class Player
    attr_accessor :plays, :name

    def initialize(name)
      @name = name
      @plays = []
      @score

    end

    def play(word)
    end

    def total_score
    end

    def won
    end

    def highest_scoring_word
    end

    def highest_word_score
    end


  end
end
