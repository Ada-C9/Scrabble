require 'awesome_print'
require 'pry'
require_relative 'player'

module Scrabble
  class Scoring
    attr_reader :word, :letter

    @@letters_hash = { ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"] => 1, ["d", "g"] => 2, ["b", "c", "m", "p"] => 3, ["f", "h", "v", "w", "y"] => 4, ["k"] => 5, ["j", "x"] => 8, ["q", "z"] => 10 }

    def initialize
      @word = word
      @letter = letter
    end

    def self.score(word)
      if word =~ /\W/ || word.length > 7 || word.length == 0
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
      if array_of_words.length == 0
        return nil
      end

      hash = {}

      array_of_words.each do |i|
        hash[i] = self.score(i)
      end

      max_score_words = hash.delete_if { |key, value| value!= hash.values.max }.keys

      max_score_words.sort_by { |i| i.length }

      if max_score_words.length == 1
        return max_score_words[0]
      elsif max_score_words[-1] == 7
        return max_score_words[-1]
      else
        return max_score_words[0]
      end
    end
  end
end
