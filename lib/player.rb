require 'pry'

module Scrabble
  class Player

    attr_reader :name, :plays, :total_score, :tiles

    def initialize(initial_name)
      @name = provided_valid_name(initial_name)
      @plays = []
      @total_score = 0
      @tiles = []
    end

    def provided_valid_name(name)
      name = "AnnoyingOne" if name.class != String || name.strip.length == 0
      return name
    end

    def play(word)
      return false if won?
      word_score = Scoring.score(word)
      return if word_score.nil?
      @plays << word
      @total_score += word_score
      return word_score
    end

    def won?
      return @total_score >= 100
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      Scoring.score(highest_scoring_word)
    end

    def draw_tiles(tile_bag)
      if tile_bag.class != TileBag
        raise ArgumentError.new("#{tile_bag} must be a TileBag")
      end
      @tiles = tile_bag.draw_tiles(MAX_LETTERS - @tiles.size)
    end

  end
end
