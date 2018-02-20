
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
      if array_of_words == []
        return nil
      end

      winning_words = []
      max_score = 0


      if array_of_words.length == 1
        winning_words << array_of_words
        return winning_words[0]
      else
        array_of_words.each do |word|
          if  score(word) > max_score || score(word) == max_score
            max_score = score(word)
            winning_words << word
          end
        end
      end

      if winning_words.count >= 2
        winner = winning_words.max_by(&:length)
        return winner
      else
        return winning_words[0]
      end

    end



  end #Scoring
end #Scrabble

# Personal tests:
# Scrabble::Scoring.score("dog")
