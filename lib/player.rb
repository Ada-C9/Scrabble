require 'awesome_print'
require_relative '../lib/scoring.rb'
require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total
    attr_accessor :tiles
    def initialize(name)
      @name = name
      @plays = Array.new
      @total = 0
      @tilebag = Scrabble::Tilebag.new
      @tiles = @tilebag.draw_tiles(7)
    end

    def play(word)
      @plays << word
      if won?
        return false
      else
        return Scrabble::Scoring.score(word)
      end
    end

    def total_score
      @total = 0

      @plays.each do |word|
        @total += Scrabble::Scoring.score(word)
      end

      return @total
    end

    def won?
      @total >= 100 ? (return true) : (return false)
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def  draw_tiles(tilebag)
      num = 7 - @tiles.length
        replace_tiles = Scrabble::Tilebag.draw_tiles(num)
        replace_tiles.each do |letter|
          @tiles << letter
        end
    end

  end
end
