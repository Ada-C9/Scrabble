require 'pry'
require_relative 'scoring.rb'
require 'awesome_print'

module Scrabble
  class Player
    attr_accessor :plays, :name

    def initialize(name)
      @name = name
      @plays = []
      @score = 0
      @won = false
      @hsw = "ERROR"
    end

    def play(word)
      if @score >= 100
        return false
      end

      error_message = "Invalid Word"

      word_score = Scrabble::Scoring.score(word)
      if word_score != nil
        @score += word_score
        @plays.push(word.upcase)
        return word_score
      else
        return error_message
      end
    end

    def total_score
      return @score
    end

    def won?
      if @score >= 100
        @won = true
      end
      return @won
    end

    def highest_scoring_word
      @hsw = Scrabble::Scoring.highest_score_from(@plays)
      return @hsw
    end

    def highest_word_score
      score = Scrabble::Scoring.score(@hsw)
      return score
    end
  end
end
