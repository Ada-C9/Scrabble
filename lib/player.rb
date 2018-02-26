require "scoring.rb"
require 'tile_bag.rb'
require "pry"

module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    # Returns an Array of the words played by the player
    def plays
      return @plays
    end

    # Adds the input word to the @plays
    # Returns the score of the word
    # Returns `false` if player has already won
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

    # Returns the total score of words played
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

    # A collection of letters that the player can play (max 7)
    def tiles
      return @tiles
    end

    # Draw 7 tiles from the given tile bag
    def draw_tiles(tile_bag)
      tile_bag = Scrabble::TileBag.new
      @tiles = tile_bag.draw_tiles(7)
    end

  end
end
