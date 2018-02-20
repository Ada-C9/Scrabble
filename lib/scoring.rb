require 'pry'

module Scrabble
  class Scoring

    SCORE_CHART = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10
    }


    def self.score(word)

      if (/\W/ =~ word.upcase) == nil #if letter_array contains only letters, it will return the score and continue

      letter_array = word.upcase.split(//)  #this will give an array of strings

        score = 0

        if letter_array.count == 7
          score += 50
        elsif letter_array.count > 7 || letter_array.length == 0
          return nil
        end

        letter_array.each do |letter|
          #if the letter matches a key in the score_chart hash, return value, add that value to variable, varible will start at zero

          if SCORE_CHART.has_key? (letter)
            score += SCORE_CHART[letter]
          end
        end
        return score
      else # the letter_array contained any special character/ number and stops.
        return nil
      end
    end

    def self.highest_score_from(array_of_words)
    end
  end #end of class
end #end of module
