require_relative "scoring"

# The constructor for Scrabble::Player should take exactly one argument: the player's name. Instances of the class should respond to the following messages:
#
# #play(word): Adds the input word to the plays Array
# Returns false if player has already won
# Otherwise returns the score of the word

# #total_score: Returns the sum of scores of played words
# #won?: If the player has over 100 points, returns true, otherwise returns false
# #highest_scoring_word: Returns the highest scoring played word
# #highest_word_score: Returns the highest_scoring_word score
require 'minitest/autorun'
require 'minitest/reporters'


module Scrabble
  class Player

    attr_accessor :name, :plays, :total_score, :tiles

    def initialize(name)
      @name = name
      # #name: returns the value of the @name instance variable
      @plays = []
      # #plays: returns an Array of the words played by the player
      @total_score = 0
      @tiles=[]

    end

    def winner
      return @total_score > 100
      end

    def play(word)
      if winner == false
        @plays << word
        @total_score += Scoring.score(word)
      else
        return false
      end
    end





  end
end
