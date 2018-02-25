require_relative './scoring'
require 'pry'

module Scrabble
  class Player
    attr_reader :name, :total_score, :tiles

    def initialize(name)
      @name = name
      @player_array = []
      @total_score = 0
      @tiles = []
    end

    def plays
      return @player_array
    end

    def play(word)
      if @total_score > 100
        return false
      end
      @player_array << word
      score = Scrabble::Scoring.score(word)
      @total_score += score.to_i
      return score
    end

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@player_array)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      until @tiles.length == 7
        @tiles  << tile_bag.draw_tiles(1)
      end
    end


  end
end
#binding.pry
