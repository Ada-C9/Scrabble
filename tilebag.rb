# require 'awesome_print'
# require 'pry'
#
# require_relative 'scoring'
#
# module Scrabble
#   class Player
#
#     attr_accessor :name, :player_words, :winner, :total_score
#
#     def initialize(name)
#       @name = name
#       @player_words = []
#       @winner = false
#       @total_score = total_score
#     end
#
#     # this method takes the input from the Player#play method and returns it as
#     # an array
#     def plays
#       return @player_words
#     end
#
#     # this method takes the user input and pushes the input into the player_words
#     # array
#     def play(player_input)
#       @player_words << player_input
#       # this is to test if the input returns as an array
#       # return player_words
#       winning_word = Scrabble::Scoring.highest_score_from(plays)
#       # return winning_word
#       plays.each do |scrabble_word|
#         score_of_word = Scrabble::Scoring.score(scrabble_word)
#         if @winner
#           return false
#         else
#           return score_of_word
#         end
#       end
#     end # end of play(player_input)
#     # binding.pry
#
#     def total_score
#       word_scores = player_words.map do |word|
#         Scrabble::Scoring.score(word)
#       end
#       @total_score = word_scores.inject(:+)
#       return @total_score
#     end
#
#     def won?
#       if @total_score > 100
#         return true
#       else
#         return false
#         # binding.pry
#       end
#     end
#
#     def highest_scoring_word
#     end
#
#     def highest_word_score
#     end
#
#   end # End of Player class
# end # End of Scrabble module
#
# test_chart = Scrabble::Player.new("Hannah")
# test_chart.play("cat")
# test_chart.play("frog")
# ap test_chart.play("eleven")
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
        score_of_word = Scrabble::Scoring.score(player_input)
        if won?
          return false
        else
          return score_of_word
        end
    end # end of play(player_input)

    def total_score
      word_scores = player_words.map do |word|
        Scrabble::Scoring.score(word)
      end
      return word_scores.inject(:+)
    end

    def won?
      if total_score > 100
        return true
      else
        return false
      end
    end

    def highest_scoring_word
    end

    def highest_word_score
    end

  end # End of Player class
end # End of Scrabble module

# Wave 3
require 'awesome_print'
require 'pry'

require_relative 'scoring'



module Scrabble
  class TileBag
    attr_reader :tiles

    DEFAULT_TILES = {
      "a" => 9,
      "b" => 2,
      "c" => 2,
      "d" => 4,
      "e" => 12,
      "f" => 2,
      "g" => 3,
      "h" => 2,
      "i" => 9,
      "j" => 1,
      "k" => 1,
      "l" => 4,
      "m" => 2,
      "n" => 6,
      "o" => 8,
      "p" => 2,
      "q" => 1,
      "r" => 6,
      "s" => 4,
      "t" => 6,
      "u" => 4,
      "v" => 2,
      "w" => 2,
      "x" => 1,
      "y" => 2,
      "z" => 1
    }

    # this code is DRY and less code then to write out each letter and value
    def initialize
      @tiles = []
      DEFAULT_TILES.each do |letter, count|
        count.times {@tiles << letter}
      end
    end

    def draw_tiles(num)

    end

    def tiles_remaining

    end
  end
end
