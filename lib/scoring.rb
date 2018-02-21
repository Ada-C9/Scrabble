module Scrabble
  class Scoring
    def self.score(word)

      # split word received, split word, pass it through...

      # step 1: handling terminal if's that return nil 
      if word == nil || word == ""  || word =~ /[^a-zA-Z]/
        return nil
      elsif word.length > 7
        return nil
      end

      # step 2: take in a string, split the word,downcase, stored in an array called "word_array"
      word_array = []
      word_array = word.downcase.split(//)
      # SCORECARD
      value_1_array = ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
      value_2_array = ["d", "g"]
      value_3_array = ["b", "c", "m", "p"]
      value_4_array = ["f", "h", "v", "w", "y"]
      value_5_array = ["k"]
      value_8_array = ["j", "x"]
      value_10_array = ["q", "z"]
      # END SCORECARD

      print word_array
      # "word_score" holds score for each "word_array"
      word_score = 0

      word_array.each do |letter|
        if value_1_array.include?(letter)
          word_score += 1
        elsif value_2_array.include?(letter)
          word_score += 2
        elsif value_3_array.include?(letter)
          word_score += 3
        elsif value_4_array.include?(letter)
          word_score += 4
        elsif value_5_array.include?(letter)
          word_score += 5
        elsif value_8_array.include?(letter)
          word_score += 8
        elsif value_10_array.include?(letter)
          word_score += 10
        end
      end
      # "word_score" holds total score for all letters in "word_array"
      puts "This is our word_score: #{word_score}"
      return word_score

      # return a number based on the point chart
      # 7 letter bonus (use .length)

    end

    def self.highest_score_from(array_of_words)
      # use score method
      # find the highest score
      # if tie:
      # fewest tiles used unless the other word used all 7 then that wins
      # if score & length are same for both high words, the first one wins

      current_highest_word = ""
    end
  end
end

Scrabble::Scoring.score("kepts")
Scrabble::Scoring.score("stampy")

# Scrabble::Scoring.score("$#&")
