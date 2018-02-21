
module Scrabble
  class Scoring

    def self.score(word)


      # TODO: fix it, better way to evaluate, with arrays.

      if word.match?(/\W/)
        return nil
      end

      if word.length > 7
        return nil
      end

      letters_array = word.upcase.split("")

      if letters_array.empty?
        return nil
      end

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

      letters_array.length == 7 ? points += 50 : points += 0

      return points
    end


    def self.highest_score_from(array_of_words = [])

      # Create & Populate array of words:
      winning_words = []
      if array_of_words == []
        return nil
      elsif array_of_words.length == 1
        winning_words << array_of_words
        return winning_words[0]
      elsif  array_of_words.max_by(&:length).length == 7
          winner = array_of_words.max_by(&:length)
          return winner
      else
        winner = array_of_words.min_by  {|word| word.length}
        return winner
      end
    end


  end #Scoring
end #Scrabble

# Personal tests:
# puts Scrabble::Scoring.score("dd")
# puts Scrabble::Scoring.score("ba")
# puts Scrabble::Scoring.score("apples")
#
# puts Scrabble::Scoring.highest_score_from(["dd", "ba"])
