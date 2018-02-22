module Scrabble
  class Scoring

    def self.score(word)
      @all_letters = {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10
      }
      @word = word.upcase
      letters = @word.split("")
      character_check = @all_letters.keys
      values_of_letters = []

      letters.each do |character|
        # Checking if character input is a valid letter or not
        # First part is splitting the hash into an array of the
        # key values 'A-Z' and then we are checking if any characters
        # are outside that range (This includes blank or nothing).
        # If so, automatically return nil
        #
        # Else, if all the characters are valid letters, take the value
        # associated with the key and put that in an array of integers
        #

        if !character_check.include?(character)
          return nil
        else
          values_of_letters << @all_letters.fetch(character)
        end
      end


      if letters.length > 0 && letters.length < 7
        sum = values_of_letters.sum
        return sum

      elsif letters.length == 7
        sum = values_of_letters.sum
        sum = sum + 50
        return sum

      else
        return nil
      end
    end

    def self.highest_score_from(array_of_words)

      all_scores = {}

      if array_of_words.length == 0
        return nil

      elsif array_of_words.length == 1
        return array_of_words

      elsif array_of_words.length > 1
        array_of_words.each do |word|
          all_scores[word] = score(word)
          # scores << score(word)
        end

        p all_scores
      end

      max_score_words = all_scores.delete_if { |word, score| score != all_scores.values.max }.keys

      # p max_score_words
      return max_score_words

    end
  end
end
