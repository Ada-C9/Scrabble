require 'awesome_print'
require 'pry'
require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player

    attr_reader :name, :played_words, :player_tiles

    def initialize(name)
      @player_tiles = []
      @name = name
      @played_words = []
    end

    def draw_tiles(tile_bag)
      @player_tiles = tile_bag.draw_tiles(7 - @player_tiles.length)
      tiles
    end

    def tiles
      return @player_tiles
    end

    def total_score
      scores = @played_words.map { |i| i = Scrabble::Scoring.score(i) }
      scores_sum = scores.reduce(:+)
      return scores_sum
    end

    def play(word)
      if Scrabble::Scoring.score(word) != nil
        @played_words << word
      else
        raise ArgumentError.new "Invalid word"
      end

      return total_score >= 100 ? false : Scrabble::Scoring.score(word)
    end

    def won?
      return total_score >= 100 ? true : false
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@played_words)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end
