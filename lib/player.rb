require_relative "./scoring.rb"
require_relative "./tilebag.rb"

module Scrabble
  class Player < TileBag

    attr_reader :name

    attr_accessor :won, :plays

    # name: returns the value of the @name instance variable
    def initialize(name)
      @name = name
      @plays = []
      @tiles = []

    end

    # Adds the input word to the plays Array
    # Returns false if player has already won
    # Otherwise returns the score of the word
    def play(word)
      return false if won?
      # if haven't won, add word to list of plays
      @plays << word
      Scoring.score(word)
    end

    # total_score: Returns the sum of scores of played words
    def total_score
      p @plays
      scores = @plays.map do |word|
        puts "Scoring word: #{word.inspect}"
        Scoring.score(word)
      end
      p scores
      p scores.sum.class
      return scores.sum
    end

    def won?
      return total_score > 100
    end

    def highest_scoring_word
      Scoring.highest_score_from
    end

    def draw_tiles(tile_bag)
      if @tiles.length == 7
        return false
      end
      num_to_draw = 7 - @tiles.length
      puts num_to_draw
      drawn_tiles = tile_bag.draw_tiles(num_to_draw)
      @tiles += drawn_tiles

    end
  end # class Player
end #

p = Scrabble::Player.new("Katherine")
tb = Scrabble::TileBag.new
puts "Before, bag has #{tb.tiles_remaining} tiles"
p.draw_tiles(tb)
puts "After, bag has #{tb.tiles_remaining} tiles"
