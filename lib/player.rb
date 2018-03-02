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

    # This whole def tiles method seems superfluous, given that the
    # constructor method exists, and given that the
    # assignment doesn't ask us to make it do anything
    # more than the attr: accessor method could make
    # it do.    We have added it in the interest of
    # following the instructors we were given, but if we were designing this on our own, we would not have included it.
    def tiles
      return @tiles
    end

    def draw_tiles(arg_tile_bag)
      newly_drawn_tiles = nil
      if arg_tile_bag.tiles_remaining < (7 - @tiles.length)
        newly_drawn_tiles = arg_tile_bag.draw_tiles(arg_tile_bag.tiles_remaining)
      else
        newly_drawn_tiles = arg_tile_bag.draw_tiles(7 - @tiles.length)
      end
      @tiles.concat(newly_drawn_tiles)

    end
  end
end
