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

    def sum()
      @words_played.inject(0) do |sum, word|
        word_score = Scrabble::Scoring.score(word)
        sum += word_score
        # binding.pry
      end
    end # method 
  end # class
end # module

player1 = Scrabble::Player.new('player1')

player1.plays('pie')
player1.plays('sock')

# player2 =Scrabble::Player.new('player2')
# puts player2.plays('cake')

puts "#{player1.words_played}"
puts "player 1 sum: #{player1.sum}"
