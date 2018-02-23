require_relative 'scoring'
require_relative 'tile_bag'


module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @scoring_table = {}
      @tiles= []
    end

    def draw_tiles(tile_bag)

      @tiles = tile_bag.draw_tiles(7 - @tiles.count)
      return @tiles
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

# player_1 = Scrabble::Player.new("Patrick")
# tile_bag = Scrabble::TileBag.new({"a" => 1, "b" => 2, "c" => 3})
#
# players_tiles = player_1.draw_tiles(tile_bag)
