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

  end
end

# player_1 = Scrabble::Player.new("Patrick")
# player_1.play("xxxxxxx")
# # # player_1.won?.must_equal true
# # puts player_1.total_score
# puts player_1.won?
