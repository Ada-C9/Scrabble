require_relative 'scoring.rb'
# require_relative 'wave-2-game.rb'
require 'pry'


module Scrabble
  class Player
    attr_reader :name, :words_played, :total_score



    def initialize(name)
      @name = name
      @words_played = []
    end


    def plays(word)
      @words_played.push(word)
      return @words_played
    end



    def play(word)
      if won? == true
        return false
      else
        a = Scrabble::Scoring.score(word)
        self.plays(word)
        return a
      end
    end

    def total_score()
      @words_played.inject(0) do |sum, word|
        word_score = Scrabble::Scoring.score(word)
        #sum += word_score
      end

      return sum
    end # method

    def won?
      if total_score > 100
        has_won = true
      else
        has_won = false
      end
      return has_won
    end

  end # class
end # module
