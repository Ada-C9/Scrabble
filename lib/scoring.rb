require "pry"

module Scrabble
  class Scoring

    SCORE_CHART = {
      "A" => 1, "E" => 1, "I" => 1, "O" => 1 , "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
      "D" => 2, "G" => 2,
      "B" => 3, "C" => 3 , "M" => 3, "P" => 3,
      "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
      "K" => 5,
      "J" => 8, "X" => 8,
      "Q" => 10, "Z" => 10}

    # Returns total score for the given word
    # Seven letter words receive 50 bonus points
    def self.score(word)
      return nil if word.length > 7 || word.length == 0

      score = 0
      word.each_char do |c|
        return nil if !SCORE_CHART.keys.include?(c.upcase)
        SCORE_CHART.each do |key, value|
          if c.upcase == key
            score += value
          end
        end
      end
      score += 50 if word.length == 7

      return score
    end

    # Returns the highest score word from the array
    def self.highest_score_from(array_of_words)
      return nil if array_of_words.length == 0

      highest_score_word = ""
      array_of_words.each do |word|
        highest_score = score(highest_score_word)
        highest_score ||= 0
        if score(word) == highest_score && highest_score_word.length != 7
          if word.length == 7 || word.length < highest_score_word.length
            highest_score_word = word
          end
        elsif score(word) > highest_score
          highest_score_word = word
        end
      end

      return highest_score_word
    end

  end
end
