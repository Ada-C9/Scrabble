require 'pry'

module Scrabble
  class Scoring
    def self.score(word) # 'dog'
      word = word.upcase
      word_array = word.split('') #['d', 'o', 'g']
      total_score = 0

      if word_array.length > 7 || word_array.length < 1
        return total_score = nil
      else
        # add 50 pts if the word is 7 letters long
        word_array.length == 7 ? total_score += 50 : total_score = 0
        word_array.each do |letter|
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
    end
  end
end
