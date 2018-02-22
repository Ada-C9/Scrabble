require_relative 'scoring'


module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
      @scoring_table = {}
    end

    def plays
      return @plays
    end

    def play(word)
      @plays << word
    end

    def total_score
      sum_of_scores = 0
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        puts "score #{word}: #{score}"

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
