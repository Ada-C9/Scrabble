require_relative 'scoring'
require_relative 'tilebag'

module Scrabble

  class Player

    attr_reader :name, :plays, :tiles

    def initialize(name)
      @name = name
      @plays = []
      @tiles = []
    end

    def play(word)
      score = Scrabble::Scoring.score(word)
      if self.won?
        return false
      elsif score.nil?
        return 0
      else
        @plays << word
        return score
      end
    end

    def total_score
      total_score = @plays.map do |word|
        Scrabble::Scoring.score(word)
      end.sum
      return total_score
    end

    def won?
      if self.total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      @plays.max_by do |word|
        Scrabble::Scoring.score(word)
      end

    end

    def highest_word_score
      if @plays.length == 0
        return 0
      else
        word = self.highest_scoring_word
        score = Scrabble::Scoring.score(word)
        return score
      end
    end

    def draw_tiles(tile_bag)
      tiles_needed = 7 - @tiles.length
      @tiles += tile_bag.draw_tiles(tiles_needed)
    end


  end # Player Class

end # Scrabble Module
