require 'pry'
require_relative 'scoring.rb'

module Scrabble

  class Player

    attr_reader :name, :plays, :won 

    def initialize(name)
      @name = name
      @won = false
      @plays = []
    end

    def play(word)
      if won?
        return false
      else
        plays << word
        total_score
        return Scrabble::Scoring.score(word)
      end
    end

  end
end
