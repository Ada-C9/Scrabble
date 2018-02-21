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

      # step 2: take in a string, split the word,downcase, stored in an array called "letter_array"
      letter_array = []
      letter_array = word.downcase.split(//)
      # SCORECARD
      value_1_array = ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
      value_2_array = ["d", "g"]
      value_3_array = ["b", "c", "m", "p"]
      value_4_array = ["f", "h", "v", "w", "y"]
      value_5_array = ["k"]
      value_8_array = ["j", "x"]
      value_10_array = ["q", "z"]
      # END SCORECARD

      print letter_array
      # "word_score" holds score for each "letter_array"
      # word_score = 0
      if letter_array.length == 7
        word_score = 50
      else
        word_score = 0
      end
      puts "If word score still lives, it'll print here only for first 50 points for a 7-letter word: #{word_score}"

      letter_array.each do |letter|
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
      # "word_score" holds total score for all letters in "letter_array"
      puts "This is our TOTAL word_score - including bonus points: #{word_score}"

      return word_score
    end

    def self.highest_score_from(array_of_words)
      provided_words_values = []

      array_of_words.each do |provided_word|
        value = Scrabble::Scoring.score(provided_word)
        provided_words_values << value
      end

      # print provided_words_values # [9, 5]

      # we want to find idx of highest value in provided_words_values array
      #https://stackoverflow.com/questions/2149802/in-ruby-what-is-the-cleanest-way-of-obtaining-the-index-of-the-largest-value-in
      # print provided_words_values.each_with_index.max[1]
      # a.each_with_index.max[1] returns index of the last maximum value found in an array

      highest_value_index  = provided_words_values.index(provided_words_values.max)

      # we then want to find word in that same idx of the array_of_words
      highest_value_word = array_of_words[highest_value_index]
      # a.index(a.max) returns index of first max value
      puts "Our highest scoring word is: #{highest_value_word}"
      # not sure if this is the right solution because we need to handle ties 


      # if tie:
      # fewest letters used unless the other word used all 7 letters then that wins
      # if score & length are same for both high words, the first one wins

    end
  end
end

# Scrabble::Scoring.score("kepts")
# Scrabble::Scoring.score("stamper")
#
# Scrabble::Scoring.score("")
#
# Scrabble::Scoring.score("$#&")
#
# Scrabble::Scoring.score("lalalalalalalala")
two_word_array = ["apple", "cat"]
Scrabble::Scoring.highest_score_from(two_word_array)
