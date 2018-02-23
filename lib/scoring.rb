###########################################################
#Class Scoring in Scrabble Module:

module Scrabble
  class Scoring

# _________________SCORE METHOD____________________
# Calculates points scored with the given word:

    def self.score(word)

      # TODO: fix it, better way to evaluate, with arrays.

      # If word contains a character that is not a letter, returns nil:
      if word.match?(/\W/)
        return nil
      end

      # If word is has more than 7 characters, returns nil:
      if word.length > 7
        return nil
      end

      # Creates a new array with each letter of the word as a diferent element:
      letters_array = word.upcase.split("")

      # If array with letters is empty, returns nil:
      if letters_array.empty?
        return nil
      end


      # Set the points for that word to initialize at zero and calculate the points of each word, adding them to the points variable:
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

      # If word has 7 letters add 50 more points:
      letters_array.length == 7 ? points += 50 : points += 0

      return points
    end


# ________________HIGHEST SCORE METHOD___________________
# Returns the word with highest score, from a given array of words:

    def self.highest_score_from(array_of_words = [])

      # Evaluate given words to find the one with highest score, according to the game rules. If there is a tie, it will populate a new array with the words in the tie and compare them to find the winner.
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
