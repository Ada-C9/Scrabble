require "scoring.rb"
require "pry"

module Scrabble
  class Player
    # returns the value of the `@name` instance variable
    attr_reader :name

    def initialize(name)
      @name = name
      @plays = []
    end

    # returns an Array of the words played by the player
    def plays
      return @plays
    end

    # Adds the input word to the `plays` Array
    # - Returns `false` if player has already won
    # - Otherwise returns the score of the `word`
    def play(word)

      if won?
        return false
      elsif @plays.include?(word)
        raise ArgumentError.new("This word has already been used!")
      else
        @plays << word
      end
      return Scrabble::Scoring.score(word)
    end

    # Returns the sum of scores of played words
    def total_score
      return @plays.reduce(0) { |memo, word| memo + Scrabble::Scoring.score(word) }
    end

    # If the player has over 100 points, returns `true`, otherwise returns `false`
    def won?
      return total_score > 100 ? true : false
    end

    # Returns the highest scoring played word
    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    # Returns the `highest_scoring_word` score
    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end


  end
end
