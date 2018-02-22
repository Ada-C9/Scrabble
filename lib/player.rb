require 'awesome_print'

module Scrabble
  class Player
    attr_reader :name, :plays, :total_score

    def initialize(name)
      @name = name
      @plays = []
      @total_score = 0
    end
    def play
    end
  end
end
