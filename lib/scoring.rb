require 'awesome_print'
module Scrabble

  MAX_LETTERS = 7

  class Scoring

    POINT_VALUES = {
      "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4, "G" => 2,
      "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1,
      "O" => 1, "P" => 3, "Q" => 10, "R" => 1, "S" => 1, "T" => 1, "U" => 1,
      "V" => 4, "W" => 4, "X" => 8, "Y" => 4,"Z" => 10
    }

    def self.score(word)
      return if !has_valid_initial_word?(word)
      score = 0
      letters = word.split("")
      # score = letters.inject { |sum, letter| sum + POINT_VALUES[letter] }
      letters.each do |letter|
        letter_score = POINT_VALUES[letter.upcase]
        return if letter_score.nil? # regex?
        score += letter_score
      end
      # scores.compact.reduce(0, :+) # and replace letter with score?
      score += 50 if letters.size == MAX_LETTERS # what if size is partly because invalid chars?
      return score
    end

    # what about array when the ONLY word is over max letter?
    def self.has_valid_initial_word?(word)
      return word.class == String && word.size.between?(1, MAX_LETTERS)
    end

    def self.highest_score_from(array_of_words)
      return if !has_valid_initial_array?(array_of_words)
      scored_words = array_of_words.group_by{ |word| score(word) }
      # ap scored_words
      highest_score = scored_words.keys.max
      winning_words = scored_words[highest_score]
      break_tie(winning_words)
    end

    def self.has_valid_initial_array?(array)
      return array.class == Array && array.length > 0
    end

    def self.break_tie(winning_words)
      winning_word = winning_words.find { |word| word.size == 7}
      if winning_word.nil?
        winning_word = winning_word.min_by { |word| word.size }
      end
      return winning_word
    end


  end
end




Scrabble::Scoring.highest_score_from(["ghost", "boo", "pumpkin","sweet", "potato", "dk"])
#
