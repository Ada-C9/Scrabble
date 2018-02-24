require_relative '../lib/scoring'
require_relative '../lib/tilebag'

module Scrabble

  class Player
    attr_accessor :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @won = false
      @tiles = []
    end

    def won?
      if total_score > 100
        @won = true
        return true
      else
        return false
      end
    end

    def play(word)
      if @won == true
        return false
      else
        @plays << word
        return true
      end
    end

    def total_score
      scores_array = @plays.map { |word| Scrabble::Scoring.score(word) }
      return scores_array.sum
    end

    def highest_scoring_word
      @top_word = Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scrabble::Scoring.score(@top_word)
    end

    def tiles
      return @tiles
    end

    def draw_tiles(tile_bag)
      newly_drawn_tiles = nil
      if Scrabble::TileBag.tiles_remaining < (7 - @tiles.length)
        newly_drawn_tiles = Scrabble::TileBag.draw_tiles(tiles_remaining.length)
      else
        newly_drawn_tiles = Scrabble::TileBag.draw_tiles(7 - @tiles.length)
      end
      @tiles << @tiles.concat(newly_drawn_tiles)
    end


  end
end
