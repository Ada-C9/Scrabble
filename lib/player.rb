require_relative "scoring"
require_relative "tilebag"

module Scrabble
  class Player
    attr_reader :name, :words_played, :score, :tiles

    def initialize(name)
      @name = name
      @words_played = []
      @score = 0
      @tiles = []
    end

    def plays
      return @words_played
    end

    def play(word)
      word_score = Scoring.score(word)
      begin
        @score += word_score
        @words_played << word.upcase
      rescue TypeError
        puts "A valid word was not entered. You have lost your turn."
        word_score = 0
      end
      word.to_s.upcase.chars.each do |letter|
        i = @tiles.find_index(letter)
        @tiles.delete_at(i || @tiles.length)
      end
      if won?
        return false
      else
        return word_score
      end
    end

    def total_score
      return @score
    end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
      return Scoring.highest_score_from(@words_played)
    end

    def highest_word_score
      return Scoring.score(highest_scoring_word)
    end

    def tiles
      return @tiles
    end

    def draw_tiles(tilebag)
      existing_tiles = @tiles.length
      max_tiles = 7
      drawn_tiles = tilebag.draw_tiles(max_tiles - existing_tiles)
      drawn_tiles.each do |letter|
        @tiles << letter
      end
      return drawn_tiles
    end
  end
end
