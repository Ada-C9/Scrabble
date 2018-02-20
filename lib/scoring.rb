require 'awesome_print'
require 'pry'

module Scrabble
  class Scoring
    attr_reader :word, :score, :letter

    @@letters_hash = { ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"] => 1, ["d", "g"] => 2, ["b", "c", "m", "p"] => 3, ["f", "h", "v", "w", "y"] => 4, ["k"] => 5, ["j", "x"] => 8, ["q", "z"] => 10 }


    def initialize
      @word = word
      @letter = letter
    end

    def self.score(word)

      if word =~ /\W/ || word.length > 7
        return nil
      end

      score = []
      word_array = word.downcase.split(//)

      word_array.each do |i|
        @@letters_hash.keys.each do |keys|
          if keys.include? i
            @letter = @@letters_hash[keys]
          end
        end
        score << @letter
      end

      return score.length == 7 ? score.sum + 50 : score.sum
    end


    def self.highest_score_from(array_of_words)

    end
  end
end

ap Scrabble::Scoring.score('')
