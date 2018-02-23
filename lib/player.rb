require 'pry'
require_relative 'scoring.rb'

module Scrabble

  class Player

    attr_reader :name, :plays, :won, :play, :player_score, :highest_scoring_word, :highest_word_score


    def initialize(name)
      @name = name
      @won = false
      @plays = []
      @player_score = 0
    end

    def play(word)
      if @won == true
        return false
      else
        @plays << word
        @player_score += Scrabble::Scoring.score(word)
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      return @player_score
    end
    # def total_score
    #   scores_array = []
    #   @plays.each do |word|
    #     scores_array << Scrabble::Scoring.score(word)
    #   end
    #   @total_score = scores_array.inject(:+)
    #   return @total_score
    # end

    def won?
      if @player_score > 100
        @won = true
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      @winner_word = Scrabble::Scoring.highest_score_from(@plays)
      return @winner_word
    end

    def highest_word_score
      score = Scrabble::Scoring.score(highest_scoring_word)
      return score
    end
  end
end
