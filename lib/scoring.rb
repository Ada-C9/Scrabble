
module Scrabble
  class Scoring

    def self.score(word)

      # TODO: fix it, better way to evaluate, with arrays.

      if word.match?(/\W/)
        return nil
      end

      letters_array = word.upcase.split("")

      points = 0
      letters_array.each do |letter|

        if letter == "Q" || letter == "Z"
          points += 10
        elsif letter == "D" || letter == "G"
          points += 2
        elsif letter =="B" || letter == "C" || letter =="M" || letter == "P"
          points += 3
        elsif letter == "F" || letter == "H" || letter == "V" || letter == "W" || letter == "Y"
          points += 4
        elsif letter == "K"
          points += 5
        elsif letter == "J" || letter == "X"
          points += 8
        else #"A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
          points += 1
        end
      end

      letters_array.length >= 7 ? points += 50 : points += 0

      return points
    end


    def self.highest_score_from(array_of_words)
    end
  end #Scoring
end #Scrabble


# Scrabble::Scoring.score("dog")
