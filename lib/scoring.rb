require 'pry'


module Scrabble
  class Scoring
    def self.letter_score(letter)
      score = 0
      case letter
      when  'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
        score += 1
      when 'D', 'G'
        score += 2
      when 'B', 'C', 'M', 'P'
        score +=	3
      when 'F', 'H', 'V', 'W', 'Y'
        score += 4
      when 'K'
        score +=	5
      when 'J', 'X'
        score +=	8
      when 'Q', 'Z'
        score += 10
      else
        score = nil
      end
      return score
    end

    def self.score(word)
      score = nil
      letters_in_word = word.upcase.split(//)

      letters_in_word.each do |letter|
        score = letter_score(letter)
        unless score == nil
          score += 50 if letters_in_word.length == 7
          score = nil if letters_in_word.length > 7
        end
      end
      return score
    end

    def self.highest_score_from(array_of_words)

    end
  end
end

# binding.pry
# Scoring::Scrabble.scoring('cat') #dan example
