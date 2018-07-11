require 'awesome_print'
require 'pry'

module Scrabble
  class Scoring
    LETTER_VALUES = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }

    def self.score(word)
      # if statement to check if the word has bad characters and space
      return nil if word.length > 7 || word.length == 0

      score = 0

      # if word only has good character then the below will execute
      word.downcase.each_char do |letter|
        return nil unless LETTER_VALUES.include?(letter)
        score += LETTER_VALUES[letter]
      end

      score += 50 if word.length == 7

      return score
    end # end of def self.score(word)

    # this method finds the top word based on score
    def self.highest_score_from(array_of_words)
      return nil if  array_of_words.length == 0

      # Loop through all the words
      #   if the current word is better than the best we've seen
      #     best word = current word
      #   end
      # end
      top_word = array_of_words.first

      array_of_words.each do |word|
        if score(word) > score(top_word)
          top_word = word
        elsif score(word) == score(top_word)
          top_word = tie_breaker(top_word, word)
        end
      end

      return top_word
    end # end of def self.highest_score_from(array_of_words)

    def self.tie_breaker(origin_winner, challenger)
      if origin_winner.length == 7
        return origin_winner
      elsif challenger.length == 7
        return challenger
      elsif challenger.length < origin_winner.length
        return challenger
      else
        return origin_winner
      end
    end
  end # end of Scoring class
end # end of Scrabble module
