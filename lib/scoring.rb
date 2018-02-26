# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

module Scrabble

  MAX_LETTERS = 7 # maximum allowable letters for a word in Scrabble.

  class Scoring

    # Stores point values for each letter.
    POINT_VALUES = {
      "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4, "G" => 2,
      "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1,
      "O" => 1, "P" => 3, "Q" => 10, "R" => 1, "S" => 1, "T" => 1, "U" => 1,
      "V" => 4, "W" => 4, "X" => 8, "Y" => 4,"Z" => 10
    }

    # Provided word must be a String comprised of only a-z/A-Z characters and
    # have a length between 1 and MAX_LETTERS (inclusive). Otherwise, throws
    # ArgumentError.
    # Returns the point value for provided word.
    def self.score(word)
      has_valid_initial_word?(word)
      score = 0
      word.each_char { |char| score += POINT_VALUES[char.upcase] }
      score += 50 if word.size == MAX_LETTERS # game rules dictate this bonus
      return score
    end

    # Provided array_of_words must be a non-empty array and only contain Strings
    # comprised of only a-z/A-Z characters and have lengths between 1 and
    # MAX_LETTERS (inclusive). Otherwise, throws ArgumentError.
    # Returns the highest scoring word from provided array_of_words. If two or
    # more words are tried and one or more words is MAX_LETTERS in length,
    # returns the first word that is MAX_LETTERS long. Otherwise, returns the first
    # instance of the shortest word.
    def self.highest_score_from(array_of_words)
      valid_initial_array_or_error(array_of_words)
      scored_words = array_of_words.group_by{ |word| score(word) }
      highest_score = scored_words.keys.max
      highest_scoring_word = scored_words[highest_score]
      return highest_scoring_word[0] if highest_scoring_word.size == 1
      return break_tie(highest_scoring_word)
    end

    private

    # Provided highest_words must be an array of one or more words with tied
    # scores.
    # If one or more words in highest_words is MAX_LETTERS in length, returns
    # the first word that is MAX_LETTERS long. Otherwise, returns the first
    # instance of the shortest word in highest_words.
    def self.break_tie(tied_words)
      highest_word = tied_words.find { |word| word.size == MAX_LETTERS}
      if highest_word.nil?
        highest_word = tied_words.min_by { |word| word.size }
      end
      return highest_word
    end

    # Throws ArgumentError if provided array_of_words is not an array, is empty,
    # or contains elements that are not Strings.
    def self.valid_initial_array_or_error(words)
      if words.class != Array || words.length == 0 || !words.all?(String)
        raise ArgumentError.new("Invalid input #{words}")
      end
    end

    # Throws ArgumentError if provided word is not an String, is not between 1
    # and MAX_LETTERS (inclusive) in size, or contains characters other than
    # a-z/A-Z.
    def self.has_valid_initial_word?(word)
      if word.class != String || !word.size.between?(1, MAX_LETTERS) ||
        !word.upcase.match?(/^[A-Z]+$/)
        raise ArgumentError.new("#{word} is not a word!")
      end
    end

  end
end
