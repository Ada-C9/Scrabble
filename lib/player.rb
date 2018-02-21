
module Scrabble

  class Player

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def plays
      return @plays
    end

    def play(word)
      @plays << word
    end

  end
end
