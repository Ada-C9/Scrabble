require "pry"
module Scrabble
  class Player
    # returns the value of the `@name` instance variable
    attr_reader :name


    def initialize()

    end

    # returns an Array of the words played by the player
    def plays
    end

    # Adds the input word to the `plays` Array
      # - Returns `false` if player has already won
      # - Otherwise returns the score of the `word`
    def play(word)
    end

    # Returns the sum of scores of played words
    def total_score
    end

    # If the player has over 100 points, returns `true`, otherwise returns `false`
    def won?
    end

    # Returns the highest scoring played word
    def highest_scoring_word
    end

    # Returns the `highest_scoring_word` score
    def highest_word_score
    end


  end
end
