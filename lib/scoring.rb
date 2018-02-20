require 'pry'

module Scrabble
  class Scoring
    def self.score(word) # 'dog'
      word_array = word.split('') #['d', 'o', 'g']
      total_score = 0
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
        end
      end
      binding.pry
      return total_score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end

print Scrabble::Scoring.score('dog')
