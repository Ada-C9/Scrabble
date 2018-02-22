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
      letters.each do |letter|
        letter_score = POINT_VALUES[letter.upcase]
        return if letter_score.nil?
        score += letter_score
      end
      score += 50 if letters.size == MAX_LETTERS
      return score
    end

    def self.has_valid_initial_word?(word)
      return word.class == String && word.size.between?(1, MAX_LETTERS)
    end

    def self.highest_score_from(array_of_words)
      return if !has_valid_initial_array?(array_of_words)
      highest_score = 0
      winning_words = []
      array_of_words.each do |word|
        score = score(word)
        return if score.nil?
        # score(word) ? score = score(word) : (return nil)
        next if score < highest_score
        if score > highest_score
          winning_words = []
          highest_score = score
        end
        winning_words << word
      end
      break_tie(winning_words)
    end

    def self.has_valid_initial_array?(array)
      return array.class == Array && array.length > 0

    end

    def self.break_tie(winning_words)
      word_size = MAX_LETTERS
      winning_word = ""
      winning_words.each do |word|
        return word if word.size == MAX_LETTERS
        next if word.length > word_size
        if word.length < word_size
          word_size = word.length
          winning_word = word
        end
      end
      winning_word
    end


  end
end
