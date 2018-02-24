require 'awesome_print'
require 'pry'

require_relative 'scoring'

module Scrabble
  class Player

    attr_accessor :name, :player_words

    def initialize(name)
      @name = name
      @player_words = []
    end

    # this method takes the input from the Player#play method and returns it as
    # an array
    def plays
      return @player_words
    end

    # this method takes the user input and pushes the input into the player_words
    # array
    def play(player_input)
      @player_words << player_input
      score_of_word = Scrabble::Scoring.score(player_input)
      if won?
        return false
      else
        return score_of_word
      end
    end # end of play(player_input)

    def total_score
      word_scores = player_words.map do |word|
        Scrabble::Scoring.score(word)
      end
      word_scores.inject(:+)
    end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

  end # End of Player class
end # End of Scrabble module
