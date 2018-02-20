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

      points_array = []
      word.chars.each do |char|
        letter_values.each do |letters, value|
          if letters.include?(char)
            points_array << value
          end
        end
      end
      points_array = points_array.inject(:+)
      return points_array
    end # self.score

    def self.highest_score_from(array_of_words)
    end
  end
end

puts Scrabble::Scoring.score('dog')
