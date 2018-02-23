require 'pry'
require_relative 'scoring.rb'

module Scrabble

  class Player

    attr_reader :name, :plays, :won, :play, :player_score, :tiles


    def initialize(name)
      @name = name
      @won = false
      @plays = []
      @player_score = 0
      @tiles = []
    end

    def play(word)
      if @won == true
        return false
      else
        @plays << word
        @player_score += Scrabble::Scoring.score(word)
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      return @player_score
    end

    def won?
      if @player_score > 100
        @won = true
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      @winner_word = Scrabble::Scoring.highest_score_from(@plays)
      return @winner_word
    end

    def highest_word_score
      score = Scrabble::Scoring.score(highest_scoring_word)
      return score
    end

    def draw_tiles(tile_bag)
      draw = 7 - @tiles.length
      @tiles.concat(tile_bag.draw_tiles(draw))
    end
  end
end
