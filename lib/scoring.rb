require 'awesome_print'
require 'pry'

module Scrabble
  class Scoring
    attr_reader :word, :score

    @@letters_hash = { ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"] => 1, ["d", "g"] => 2, ["b", "c", "m", "p"] => 3, ["f", "h", "v", "w", "y"] => 4, ["k"] => 5, ["j", "x"] => 8, ["q", "z"] => 10 }



    def initialize
      @word = word
    end

    def self.score(word)

      score = []

      dog_array = word.split(//)

      dog_array.each do |i|
        @@letters_hash.include? i
        letter = @@letters_hash[i]
        score << letter
      end
      return score.sum
    end


    def self.highest_score_from(array_of_words)

    end
  end
end

# ap Scrabble::Scoring.score('dog')
