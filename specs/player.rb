require_relative '../lib/scoring'

module Scrabble
  class Player

    def initialize(name)
      @name = name
      @player_words_array = []
      @player_total = 0
      return @name
    end

  end
end
