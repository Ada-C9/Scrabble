require 'awesome_print'
require 'pry'

require_relative 'scoring'

module Scrabble
  class Player

    attr_accessor :name, :player_words

    def initialize(name)
      @name = name
      @player_words = []
    end

    # this method takes the input from the Player#play method and returns it as
    # an array
    def plays
      return @player_words
    end

    # this method takes the user input and pushes the input into the player_words
    # array
    def play(player_input)
      @player_words << player_input
    end
    # binding.pry

    def total_score
    end

    def won?
    end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end # End of Player class
end # End of Scrabble module



test_chart = Scrabble::Player.new("Hannah")
test_chart.play("cat")
test_chart.play("frog")
ap test_chart.play("eleven")
