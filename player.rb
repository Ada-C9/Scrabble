module Scrabble
  class Player

    def initialize(name)
      @name = name
    end
  end
end

puts Scrabble::Player.new("jill")
