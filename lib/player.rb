require_relative 'scoring.rb'


module Scrabble
  class Player
    attr_reader :name



    def initialize(name)
      @name = name
      @plays = []
    end


    def plays(word)
      @plays.push(word)
      return @plays
    end



    def play(word)
      has_won = false
      if has_won == true
        return false
      else
        a = Scrabble::Scoring.score(word)
        self.plays(word)
        return a
      end
    end

  end
end

 player1 = Scrabble::Player.new('player1')

 player1.plays('pie')

 player2 =Scrabble::Player.new('player2')

 puts player2.plays('cake')

 puts player1.plays('danish')
