require 'awesome_print'
require_relative '../lib/scoring.rb'
require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total

    def initialize(name)
      @name = name
      @plays = Array.new
      @total = 0
    end

    def play(word)
      @plays << word
        if won?
         return false
       else
         return Scrabble::Scoring.score(word)
       end
    end

    def total_score
      @total = 0

      @plays.each do |word|
        @total += Scrabble::Scoring.score(word)
      end

      return @total
    end

    def won?
      @total >= 100 ? (return true) : (return false)
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

  end
end
