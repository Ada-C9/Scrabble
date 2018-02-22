require 'pry'
require_relative 'scoring'
require_relative 'tile_bag'
module Scrabble
  class Player
    attr_accessor :name, :plays, :total_score, :tiles
    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
    end

    # Original Version
    def play(word)
      @plays << word
      if won?
        return false
      else
        score = Scrabble::Scoring.score(word)
        @total_score += score
        return score
        return
      end
    end

    # def play(word)
    #   @plays << word
    #   if won?
    #     return false
    #   else
    #     score = Scrabble::Scoring.score(word)
    #     @total_score += score
    #     return score
    #     return
    #   end
    # end

    def draw_tiles(tile_bag)
      tiles_need = 7 - @tiles.length
      @tiles << tile_bag.draw_tiles(tiles_need)
    end

    def highest_scoring_word
      highest_score_word = Scrabble::Scoring.highest_score_from(@plays)
      return highest_score_word
    end

    def highest_word_score

      Scrabble::Scoring.score(highest_scoring_word)
    end

    def won?
      # If the player has over 100 points, returns true, otherwise returns false
      if total_score > 100
        return true
      else
        return false
      end
    end

  end # Player class end
end # Scrabble end
