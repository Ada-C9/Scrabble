require 'awesome_print'
require 'pry'

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

      high_score = 0
      array_of_words = []

      hash.each do |k, v|
        if v >= high_score
          high_score = v
        end
      end

      max_scores = hash.delete_if { |key, value| value!= hash.values.max }.keys

      if max_scores.length == 1
        return max_scores[0]
      else
        max_scores.sort_by do |i|
          if i.length == 7
            return i
          end
        end
      end
      # array_of_scores = []
      # high_score = 0
      # high_score_array = []
      #
      # array_of_words.each do |i|
      #   current_score = self.score(i)
      #   if current_score >= high_score
      #     high_score = current_score
      #   end
      #
      # array_of_words.each do |i|
      #   array_of_scores << self.score(i)
      # end
      #
      # array_of_scores.each do |i|
      #   if i == high_score
      #     high_score_array << i
      #   end
      # end
      #
      # if high_score_array.length > 1
      #

    end
  end
end

Scrabble::Scoring.highest_score_from(["aaa", "nnn", "g"])
