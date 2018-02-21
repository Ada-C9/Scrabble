#require_relative '/scoring.rb'
require 'awesome_print'

module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      #returns the value of the @name instance variable
      @name = name
      @array_of_words = []
    end

    def plays
      #returns an Array of the words played by the player
      return @array_of_words
    end

    def play(word)
      #Adds the input word to the plays Array
      @array_of_words << word
    end

    def total_score
      #Returns the sum of scores of played words
    end

    def won?
       #If the player has over 100 points, returns true, otherwise returns false
    end

    def highest_scoring_word
      #Returns the highest scoring played word
    end

    def highest_word_score
      #Returns the highest_scoring_word score
    end

  end
end
