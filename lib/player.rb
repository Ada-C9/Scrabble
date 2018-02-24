<<<<<<< HEAD
require_relative '../lib/scoring'
=======
require_relative './scoring'
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
require 'pry'

module Scrabble
  class Player
<<<<<<< HEAD
    attr_reader :name, :total_score, :player_total_score
=======
    attr_reader :name, :total_score
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57

    def initialize(name)
      @name = name
      @player_array = []
      @total_score = 0
<<<<<<< HEAD
      @player_total_score = 0
=======
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
    end

    def plays
      return @player_array
    end

    def play(word)
      if @total_score > 100
        return false
      end
      @player_array << word
      score = Scrabble::Scoring.score(word)
      @total_score += score.to_i
      return score
    end

    # def total_score
    #   @player_array.each do |word|
    #     played_word_score = Scrabble::Player.play(word)
    #     @player_total_score += played_word_score
    #   end
    #   return player_total_score
    # end

    def won?
      if @total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@player_array)
    end

    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end
#binding.pry
