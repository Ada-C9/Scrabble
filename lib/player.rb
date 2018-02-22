require_relative 'scoring'


module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
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
      hash = {}
      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        hash["#{word}"] = score
      end
      winning_word_player = hash.key(hash.values.max)
      puts hash
      return winning_word_player
    end

  end
end
