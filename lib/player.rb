require_relative 'scoring'
require_relative 'tile_bag'


module Scrabble

  class Player < TileBag

    attr_reader :name, :plays, :tiles_drawn

    def initialize(name)
      @name = name
      @plays = []
      @scoring_table = {}
      @tiles= []
      # @tiles_drawn = super
    end

    def draw_tiles(tile_bag)
      # @tiles << super(7 - @tiles.count)
      @tiles << super(7 - @tiles.count)
    end

    def play(word)
      @plays << word
    end

    def total_score
      sum_of_scores = 0
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)

        sum_of_scores += score
      end
      return sum_of_scores
    end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end


    def highest_scoring_word
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        @scoring_table["#{word}"] = score
      end
      winning_word_player = @scoring_table.key(@scoring_table.values.max)
      return winning_word_player
    end

    def highest_word_score
      highest_scoring_word
      return @scoring_table.values.max
    end
  end
end
