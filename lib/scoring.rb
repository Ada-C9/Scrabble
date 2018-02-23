module Scrabble
  class Scoring
    CHART = {"A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" =>4, "G" => 2, "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1, "O" => 1, "P" => 3, "Q" => 10, "R" => 1, "S" => 1, "T" => 1, "U" => 1, "V" => 4, "W" => 4, "X" => 8, "Y" => 4, "Z" => 10}
    def self.score(word)
      return nil if word !~ /^[a-zA-Z]{0,7}$/ || word == ""
      total = 0
      # letters is a array of upcase letters
      letters = word.upcase.chars.to_a

      letters.map{ | letter |
        total += CHART[letter] }

      total += 50 if word.length == 7
      return total
    end

    def self.highest_score_from(array_of_words)
      return nil if array_of_words == []
      # Gives array of scores
      scores = array_of_words.map{|word| score(word)}
      highest_score = scores.max
      # Selects highest scoring words and return it into array
      highest_scoring_words = array_of_words.select { |word| word if score(word) ==  highest_score }
      return highest_scoring_words[0] if highest_scoring_words.length == 1

      highest_scoring_words.each do |word|
        return word if word.length == 7
      end

      return highest_scoring_words.min_by { |word| word.length }

    end
  end
end
