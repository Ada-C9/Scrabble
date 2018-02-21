require_relative "scoring"

module Scrabble
  class Player
    attr_accessor :name, :plays
    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word
      if won?
        return false
      else
        Scrabble::Scoring.score(word)
      end

    end

    




  end

end
