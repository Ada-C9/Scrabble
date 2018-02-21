require 'pry'

module Scrabble
  class Scoring
    # LETTERS = {
    #   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    #   2 => ["D", "G"],
    #   3 => ["B", "C", "M", "P"],
    #   4 => ["F", "H", "V", "W", "Y"],
    #   5 => ["K"],
    #   8 => ["J", "X"],
    #   10 => ["Q", "Z"]
    # }
    def self.score(word) # 'dog'
      word = word.upcase
      word_array = word.split('') #['D', 'O', 'G']
      total_score = 0

      if word_array.length > 7 || word_array.length < 1
        return total_score = nil
      else
        # add 50 pts if the word is 7 letters long
        total_score += 50 if word_array.length == 7
        word_array.each do |letter|
          # letter_points = LETTERS.find { |key, values|
          #   values.include?(letter)
          # }.first
          # total_score += letter_points

          case letter
          when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
            total_score += 1
          when "D", "G"
            total_score += 2
          when "B", "C", "M", "P"
            total_score += 3
          when "F", "H", "V", "W", "Y"
            total_score += 4
          when "K"
            total_score += 5
          when "J", "X"
            total_score += 8
          when "Q", "Z"
            total_score += 10
          else
            total_score = nil
          end # case letter
        end # word_array.each
        return total_score
      end # if > 7 statement
    end # self.score method

    def self.highest_score_from(array_of_words)
      return nil if array_of_words == []
      return array_of_words[0] if array_of_words.length == 1
      score_tracker = {}
      array_of_words.each do |word|
        word_score = self.score(word)
        score_tracker[word] = word_score
      end # array_of_words.each
      max = Hash[score_tracker.select { |k, v| v == score_tracker.values.max}]
      max.each do |k,v|
        unless k.length == 7
          return k.length.min
        end # max.each
      end # score_tracker
      # score_tracker.each {|k,v|return k if v == score_tracker.values.max}
    end # self.highest_score_from
  end # Scoring class
end # Scrabble module

puts Scrabble::Scoring.score('dogrrrr')
