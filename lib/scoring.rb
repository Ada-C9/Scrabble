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
<<<<<<< HEAD

      # Checks if the array is empty. And will return nil if empty

      if array_of_words.length == 0
        return nil
      end
      # We can only enter this loop if the array is not empty
=======
      if array_of_words.length == 0
        return nil
      end
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
      array_of_words.each do |word|
        # If the length is 7, the score will be checked and will return highest score
        # If both scores are the same, it will return the first word.

        if word.length == 7
          if self.score(word) > max_score
            max_score = self.score(word)
            str = word
          end
          # If the word length is less than 7 then it will check the score and replace
          # The max scrore. It will return the word and keep the word length.

        elsif word.length < 7
          if self.score(word) > max_score
            max_score = self.score(word)
            max_length = word.length
            str = word
<<<<<<< HEAD

            # If two words are the same score and length, we will take the word that has
            # the least amount of tiles.

          elsif Scrabble::Scoring.score(word) == max_score && word.length < max_length
            max_score = Scrabble::Scoring.score(word)
=======
          elsif self.score(word) == max_score && word.length < max_length
            max_score = self.score(word)
>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
            max_length = word.length
            str = word
          end
        end
      end
      return str
    end
<<<<<<< HEAD
=======

    array = ["aeiou", "uoiea"]
     puts self.highest_score_from(array)

>>>>>>> e73a893777d29f0b78c7fdba0a5760f269973e57
  end
end

array = ["aeiou", "uoiea"]
puts Scrabble::Scoring.highest_score_from(array)
