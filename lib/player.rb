require_relative 'scoring.rb'
# require_relative 'wave-2-game.rb'
require 'pry'


module Scrabble
  class Player
    attr_reader :name, :words_played



    def initialize(name)
      @name = name
      @words_played = []
    end


    def plays #(word)
      return @words_played
      # @words_played.push(word)
      # return @words_played
    end

    def play(word)
      @words_played.push(word)

      if won?
        return false
      else
        return Scrabble::Scoring.score(word)
        # self.plays(word)
        # return a
      end
    end

    def total_score()
      word_scores = @words_played.map do |word|
        Scrabble::Scoring.score(word)
      end
      # @words_played.inject(0) do |sum, word|
      #   word_score = Scrabble::Scoring.score(word)
      #   #sum += word_score
      # return sum
      # end

      # return sum
      return word_scores.inject(:+)
    end # method

    def won?
      if total_score > 100
        has_won = true
      else
        has_won = false
      end
      return has_won
    end

    def highest_word_score
      highest_word = Scrabble::Scoring.highest_score_from(@words_played)
      return Scrabble::Scoring.score(highest_word)
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@words_played)
    end

  end # class
end # module
