require_relative 'scoring'
require 'pry'

module Scrabble
  class Player
    attr_reader :name, :total_score, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def plays
      return @plays
    end

    def play(word)
      @plays << word
      if @total_score > 100
        return false
      else
        @total_score += Scoring.score(word)
        return Scoring.score(word)
      end
    end

    def won?
      return @total_score > 100 ? true : false
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(our_tilebag)
      new_tiles = our_tilebag.draw_tiles(MAX_WORD_LENGTH - @tiles.length)
      new_tiles.each do |tile|
        @tiles << tile
      end
    end
  end
end
# binding.pry
