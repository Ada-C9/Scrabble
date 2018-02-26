
module Scrabble
  class Scoring
    def self.score(word)
      total_score = 0

      # if statement to check if the word has bad characters and space
      if /[[\W][\s]+?]/.match(word)
        return nil
      end

      # if word only has good character then the below will execute
      scrabble_word = word.split(//)
      if scrabble_word.length > 7 || scrabble_word.length == 0
        return nil
      elsif scrabble_word.length == 7
        total_score += 50
      end

      scrabble_word.each do |letter|
        case letter.downcase
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          total_score += 1
        when "d", "g"
          total_score += 2
        when "b", "c", "m", "p"
          total_score += 3
        when "f", "h", "v", "w", "y"
          total_score += 4
        when "k"
          total_score += 5
        when "j", "x"
          total_score += 8
        when "q", "z"
          total_score += 10
        end
      end
      return total_score
    end

    def self.highest_score_from(array_of_words)
      max_score = 0
      str = " "
      max_length = 8
      if array_of_words.length == 0
        return nil
      end
<<<<<<< HEAD

=======
>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
      array_of_words.each do |word|
        if word.length == 7
          if self.score(word) > max_score
            max_score = self.score(word)
            str = word
          end
<<<<<<< HEAD

=======
>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
        elsif word.length < 7
          if self.score(word) > max_score
            max_score = self.score(word)
            max_length = word.length
            str = word
<<<<<<< HEAD

          elsif Scrabble::Scoring.score(word) == max_score && word.length < max_length
            max_score = Scrabble::Scoring.score(word)

=======
          elsif self.score(word) == max_score && word.length < max_length
            max_score = self.score(word)
>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
            max_length = word.length
            str = word
          end
        end
      end
      return str
    end
<<<<<<< HEAD
=======

    # array = ["aeiou", "uoiea"]
    #  puts self.highest_score_from(array)

>>>>>>> 63e10b980789cec14cd9c17435143fee723b3388
  end
end
