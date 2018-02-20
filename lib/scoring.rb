require 'awesome_print'

module Scrabble
  class Scoring
    def self.score(word)
      score_1 = %w[a e i o u l n r s t]
      score_2 = %w[d g]
      score_3 = %w[b c m p]
      score_4 = %w[f h v w y]
      score_5 = %w[k]
      score_8 = %w[j x]
      score_10 = %w[q z]

      #letters_array = []
      letters_array = word.split(//)
      ap "**************"
      ap letters_array
      ap "--------------"
      score = 0
      letters_array.each do |letter|

        case letter
        when "a" ,"e","i","o", "u", "l", "n", "r" ,"s","t"
          score += 1
        when "d", "g"
          score += 2
        when "b","c","m","p"
          score += 3
        when score_4
          score += 4
        when score_5
          score += 5
        when score_8
          score += 8
        when score_10
          score += 10
        end
      end
      return score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end
