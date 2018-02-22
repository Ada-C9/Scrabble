require "scoring.rb"
require 'tile_bag.rb'
require "pry"

module Scrabble
  class Player
    # returns the value of the `@name` instance variable
    attr_reader :name

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
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

    # a collection of letters that the player can play (max 7)
    def tiles
      return @tiles
    end

    # fills tiles array until it has 7 letters from the given tile bag
    # - It is not in the primary requirements to modify the existing `#play(word)` to use `#tiles` or check against the player's tiles
    def draw_tiles(tile_bag)
      tile_bag = Scrabble::TileBag.new
      @tiles = tile_bag.draw_tiles(7)
    end

  end
end
