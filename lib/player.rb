require_relative 'scoring.rb'
# require_relative 'wave-2-game.rb'
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
      if won? == true

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

    def highest_scoring_word
      word_scores = []

      @words_played.each_with_index do |word, index|
        score = Scrabble::Scoring.score(word)
        word_scores << score
      end

        max = word_scores.max
        index = word_scores.index(max)
        highest_scoring_word = @words_played[index]
      # return word_scores.max[word] = word

      return highest_scoring_word

    end

    def highest_word_score
      word_scores = []

      @words_played.each do |word|
        score = Scrabble::Scoring.score(word)
        word_scores << score
      end

      return word_scores.max
    end

  end # class
end # module

player1 = Scrabble::Player.new('player1')

#player1.play('pie')
player1.play( 'zzzzzzzzzzzzzzzzzzzz')
player1.play('pie')
#player1.highest_scoring_word
#player1.highest_word_score
#player1.play('pie')
# player2 = Scrabble::Player.new('player2')
# player2.plays('cake')
#
# game = Scrabble::Game.new
# puts game.highest_scoring_word



# puts "#{player1.words_played}"
# puts "player 1 sum: #{player1.total_score}"
