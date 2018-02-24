require_relative 'scoring'
require_relative 'dictionary'

module Scrabble
  class Player
    attr_reader :name, :total_score, :tiles, :plays
    attr_writer :tiles

    def initialize(name, use_dictionary=true)
      @name = name
      @plays = []
      @total_score = 0
      @tiles = []
      @use_dictionary = use_dictionary
    end

    def play(word)
      word_arr = word.chars
      @tiles.each do |tile|
        word_arr.each do |letter|
          word_arr.delete_at(word_arr.index letter) if tile == letter
        end
      end
      if word_arr.length == 0 && (!@use_dictionary || Dictionary.find(word))
        @plays << word
        if @total_score > 100
          return false
        else
          @total_score += Scoring.score(word)
          return Scoring.score(word)
        end
      else
        return false
      end
    end

    def won?
      return @total_score > 100 ? true : false
    end

    def highest_scoring_word
      return Scrabble::Scoring.highest_score_from(@plays)
    end

    def highest_word_score
      return Scrabble::Scoring.score(highest_scoring_word)
    end

    def draw_tiles(our_tilebag)
      new_tiles = our_tilebag.draw_tiles(MAX_WORD_LENGTH - @tiles.length)
      new_tiles.each do |tile|
        @tiles << tile
      end
    end
  end
end
