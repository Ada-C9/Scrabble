require 'pry'
require_relative 'scoring.rb'
require_relative 'tile_bag.rb'
require 'awesome_print'

module Scrabble
  class Player
    attr_accessor :name
    attr_reader :plays, :tiles_hand

    def initialize(name)
      @name = name
      @plays = []
      @score = 0
      @won = false
      @hsw = "ERROR"
      @tiles_hand = []
    end

    def play(word)
      if @score >= 100
        return false
      end

      error_message = "Invalid Word"

      word_score = Scrabble::Scoring.score(word)
      if word_score != nil
        @score += word_score
        @plays.push(word.upcase)
        return word_score
      else
        return error_message
      end
    end

    def total_score
      return @score
    end

    def won?
      if @score >= 100
        @won = true
      end
      return @won
    end

    def highest_scoring_word
      @hsw = Scrabble::Scoring.highest_score_from(@plays)
      return @hsw
    end

    def highest_word_score
      score = Scrabble::Scoring.score(@hsw)
      return score
    end

    def tiles
      @tiles_hand.each do |tile|
        puts tile
      end
    end

    def draw_tiles(tile_bag)
      num = 7 - @tiles_hand.length
      @tiles_hand += tile_bag.draw_tiles(num)
      return @tiles_hand
    end

  end
end

game_1 = Scrabble::TileBag.new
player_1 = Scrabble::Player.new("Issac")
player_1.draw_tiles(game_1)
player_1.tiles







#
