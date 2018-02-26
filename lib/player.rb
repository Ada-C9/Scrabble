require_relative '../lib/scoring'
require 'pry'
require "awesome_print"

module Scrabble
  class Player

    attr_reader :name, :total_score, :tiles

    def initialize(name)
      # @name = player name
      @name = name
      # @plays = array of words the player has played
      @played_words = []
      # @total_score = total of scores for all words played by the player
      @total_score = 0
      @tiles = []
    end

    def plays
      return @played_words
    end

    def play(word)
      if won
        return false
      end

      word_score = Scrabble::Scoring.score(word)
      if (word_score == nil)
        return nil
      end

      @played_words.push(word)
      @total_score += word_score
      return word_score
    end

    def draw_tiles(tile_bag)
      current_hand = @tiles.length
      what_they_need = 7 - current_hand
      drawn_tiles = tile_bag.draw_tiles(what_they_need)
      @tiles = drawn_tiles + @tiles

    end

    def won
      if @total_score < 100
        return false
      else
        return true
      end
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@played_words)
    end

    def highest_word_score
      word = highest_scoring_word
      score = Scrabble::Scoring.score(word)
      return score
    end

  end
end

# sally = Scrabble::Player.new("Sally")
# sally.play("apple")
# sally.play("dolphin")
# sally.play("xxxxxxx")
# ap sally.plays
# ap sally.won
