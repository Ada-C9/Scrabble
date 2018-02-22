require 'pry'
require_relative 'scoring.rb'

module Scrabble

  class Player

    attr_reader :name, :plays, :won, :winner

    def initialize(name)
      @name = name
      @winner = false
      @plays = []
    end

    def play(word)
      if @won
        return false
      else
        plays << word
        total_score
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      scores_array = []
      @plays.each do |word|
        scores_array << Scrabble::Scoring.score(word)
      end
      @total_score = scores_array.inject(:+)
      return @total_score
    end

    def won?
      if total_score > 100
        return true
      end
    end
  end
end
