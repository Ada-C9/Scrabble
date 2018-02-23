require 'awesome_print'
require 'pry'

module Scrabble
  class Player

    attr_accessor :name, :player_words

    def initialize(name)
      @name = name
      @player_words = []
    end

    def plays
      return @player_words
    end

    def play(word)
      @player_words << word
      return @player_words
    end

    def total_score
    end

    def won?
    end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end # End of Player class
end # End of Scrabble module
