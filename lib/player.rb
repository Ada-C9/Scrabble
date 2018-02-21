require 'pry'
require_relative 'scoring.rb'
require 'awesome_print'

module Scrabble
  class Player
    attr_accessor :plays, :name

    def initialize(name)
      @name = name
      @plays = []
      @score = 0
    end

    def play(word)
      if @score >= 100
        return false
      end

      @plays.push(word.upcase)
      word_score = Scrabble::Scoring.score(word)
      @score += word_score
      return word_score
    end

    def total_score
      return @score
    end

    # def won
    #   if @score >= 100
    #     @won = true
    #   end
    # end

    # def highest_scoring_word
    # end
    #
    # def highest_word_score
    # end

  end

  # player_1 = Scrabble::Player.new("lily")
  # # player_1.score = 100
  # player_1.play("zzzzqqz")

end
