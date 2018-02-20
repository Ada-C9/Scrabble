require 'pry'

module Scrabble

  class Scoring
    def self.score(word)
      letter_values = {
        ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
        ['d', 'g'] => 2,
        ['b', 'c', 'm', 'p'] => 3,
        ['f', 'h', 'v', 'w', 'y'] => 4,
        ['k'] => 5,
        ['j', 'x'] => 8,
        ['q', 'z'] => 10
      }
      max_word_length = 7

      points_array = []
      word.chars.each do |char|
        letter_values.each do |letters, value|
          if letters.include?(char)
            points_array << value
          end
        end
      end
      points = points_array.inject(:+)

      if word.length > max_word_length
        return nil
      elsif word.length == max_word_length
        points += 50
      end

      return points
    end # self.score

    def self.highest_score_from(array_of_words)
    end
  end
end

 Scrabble::Scoring.score('watermelon')
 binding.pry
