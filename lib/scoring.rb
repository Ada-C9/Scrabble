require 'awesome_print'

module Scrabble
  class Scoring
    def self.score(word)
      letters_array = word.split(//)

      score = 0
      letters_array.each do |letter|
        case letter
        when "a" ,"e","i","o", "u", "l", "n", "r" ,"s","t"
          score += 1
        when "d", "g"
          score += 2
        when "b","c","m","p"
          score += 3
        when "f", "h", "v", "w", "y"
          score += 4
        when "k"
          score += 5
        when "j", "x"
          score += 8
        when "q", "z"
          score += 10
        end
      end
      return score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end
