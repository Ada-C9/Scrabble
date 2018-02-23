
ALL_LETTERS = {
  "A"=>1, "B"=>3, "C"=>3, "D"=>2,
  "E"=>1, "F"=>4, "G"=>2, "H"=>4,
  "I"=>1, "J"=>8, "K"=>5, "L"=>1,
  "M"=>3, "N"=>1, "O"=>1, "P"=>3,
  "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
  "U"=>1, "V"=>4, "W"=>4, "X"=>8,
  "Y"=>4, "Z"=>10
}

module Scrabble
  class Scoring

    def self.score(word)

      word = word.upcase
      letters = word.split("")
      character_check = ALL_LETTERS.keys
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


        if !character_check.include?(character) || letters.length == 0 || letters.length > 7
          return nil

        else
          values_of_letters << ALL_LETTERS.fetch(character)

        end
      end

      score = values_of_letters.sum

      return letters.length == 7 ? score + 50 : score

    end

    def self.highest_score_from(array_of_words)

      all_scores = {}

      return nil if array_of_words.length == 0

      if array_of_words.length == 1
        winning_word = array_of_words.first

      elsif array_of_words.length > 1
        array_of_words.each do |word|
          all_scores[word] = score(word)

          max_score_words = all_scores.delete_if { |word, score| score != all_scores.values.max }.keys

          if max_score_words.any? { |word| word.length == 7 }
            winning_word = max_score_words.max_by(&:length)

          elsif  max_score_words.all? { |word| word.length == word.length }
            winning_word = max_score_words[0]

          else
            winning_word = max_score_words.min_by(&:length)

          end
        end

        return winning_word

      end
    end
  end
end
