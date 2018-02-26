require_relative "./scoring.rb"
require_relative "./tilebag.rb"

module Scrabble
  class Player < TileBag

    attr_reader :name

    attr_accessor :won, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      return false if won?
      @plays << word
      Scoring.score(word)
    end

    def total_score
      scores = @plays.map do |word|
        Scoring.score(word)
      end
      return scores.sum
    end

    def won?
      return total_score > 100
    end

    def highest_scoring_word
      Scoring.highest_score_from
    end

    def draw_tiles(tile_bag)
      if @tiles.length == 7
        return false
      end
      num_to_draw = 7 - @tiles.length
      # puts num_to_draw
      drawn_tiles = tile_bag.draw_tiles(num_to_draw)
      @tiles += drawn_tiles
      end

  end # class Player
end # module Scrabble
