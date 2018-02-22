require_relative '../lib/scoring'


module Scrabble

  class Player

    attr_accessor :name, :plays, :won, :total_score

    def initialize(name = "No Face")
      @name = name
      @plays = []
      @won = false
      @total_score = 0

    end

    def play(word)

      if @total_score > 100
        @won = true
        return false
      else
        word_score = Scrabble::Scoring.score(word)
        @plays << word
        @total_score = @plays.map {|word| Scrabble::Scoring.score(word)}.sum
        return word_score
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end



  end # end of class
end #end of module
