require_relative '../lib/scoring'
require_relative '../lib/tile-bag'


module Scrabble

  class Player

    attr_accessor :name, :plays, :won, :total_score, :tile_bag, :tiles

    def initialize(name = "No Face", tile_bag = Scrabble::TileBag.new.tile_bag)
      @tile_bag = tile_bag
      @name = name
      @plays = []
      @won = false
      @total_score = 0
      @tiles = []

    end

    def play(word) #checks if won and updates current word score

      if @total_score > 100
        @won = true
        return false
      else
        word_score = Scrabble::Scoring.score(word)
        @plays << word
        @total_score = @plays.map {|w| Scrabble::Scoring.score(w)}.sum
        return word_score
      end
    end

    def draw_tiles(tile_bag)

      # Scrabble::TileBag.
    end



    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end



  end # end of class
end #end of module
