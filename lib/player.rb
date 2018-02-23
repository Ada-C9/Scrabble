module Scrabble
  class Player
    attr_reader :name
    def initialize(player_name)
      @name = player_name
      @played_words = []
    end

    def plays
      return  @played_words
    end
  end
end
