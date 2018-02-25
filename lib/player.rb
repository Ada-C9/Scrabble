require 'awesome_print'
require 'pry'

require_relative 'scoring'
require_relative 'tilebag'

module Scrabble
  class Player

    attr_accessor :name, :player_words, :tiles

    def initialize(name)
      @name = name
      @player_words = []
      @tiles = []
    end # end of initialize

    # this method takes the input from the Player#play method and returns it as
    # an array
    def plays
      return @player_words
    end # end of plays

    # this method takes the user input and pushes the input into the player_words
    # array
    def play(player_input)
      @player_words << player_input
      score_of_word = Scrabble::Scoring.score(player_input)
      if won?
        return false
      else
        return score_of_word
      end
    end # end of play(player_input)

    # this method adds up all the scores of the player_words array
    def total_score
      word_scores = player_words.map do |word|
        Scrabble::Scoring.score(word)
      end
      word_scores.inject(:+)
    end # end of total_score

    # this method takes the total score and see if the player won or not
    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end # end of won?

    # this method returns the highest scoring word
    def highest_scoring_word
      Scrabble::Scoring.highest_score_from(plays)
    end # end of highest_scoring_word

    # this method returns the highest scoring word's score
    def highest_word_score
      Scrabble::Scoring.score(highest_scoring_word)
    end # end of highest_word_score

    # this method counts how many tiles the player has and draws the tiles
    def draw_tiles(tile_bag)
      number_of_tiles = 7 - @tiles.length
      @tiles += tile_bag.draw_tiles(number_of_tiles)
    end # end of draw_tiles(tile_bag)

  end # end of Player class
end # end of Scrabble module
