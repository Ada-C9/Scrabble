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

      end

    end

  end

end
