require_relative 'scoring.rb'
require 'pry'


module Scrabble
  class Player
    attr_reader :name, :words_played



    def initialize(name)
      @name = name
      @words_played = []
    end


    def plays(word)
      @words_played.push(word)
      return @words_played
    end



    def play(word)
      has_won = true
      if has_won == true
        puts "You've already won."
        return false
      else
        a = Scrabble::Scoring.score(word)
        self.plays(word)
        return a
      end
    end

    def total_score()

      @words_played.inject(0) do |total_score1, word|
        word_score = Scrabble::Scoring.score(word)
        total_score1 += word_score
        # return
      end
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

player1 = Scrabble::Player.new('player1')

player1.plays('pie')
player1.plays( 'zzzzzzzzzzzzzzzzzzzz')
player1.won?

# player2 =Scrabble::Player.new('player2')
# puts player2.plays('cake')

puts "#{player1.words_played}"
puts "player 1 sum: #{player1.total_score}"
