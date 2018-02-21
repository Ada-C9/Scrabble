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
      VALUE_1_ARRAY = ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
      VALUE_2_ARRAY = ["d", "g"]
      VALUE_3_ARRAY = ["b", "c", "m", "p"]
      VALUE_4_ARRAY = ["f", "h", "v", "w", "y"]
      VALUE_5_ARRAY = ["k"]
      VALUE_8_ARRAY = ["j", "x"]
      VALUE_10_ARRAY = ["q", "z"]
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
        if VALUE_1_ARRAY.include?(letter)
          word_score += 1
        elsif VALUE_2_ARRAY.include?(letter)
          word_score += 2
        elsif VALUE_3_ARRAY.include?(letter)
          word_score += 3
        elsif VALUE_4_ARRAY.include?(letter)
          word_score += 4
        elsif VALUE_5_ARRAY.include?(letter)
          word_score += 5
        elsif VALUE_8_ARRAY.include?(letter)
          word_score += 8
        elsif VALUE_10_ARRAY.include?(letter)
          word_score += 10
        end
      end
      # "word_score" holds total score for all letters in "letter_array"
      puts "This is our TOTAL word_score - including bonus points: #{word_score}"

      return word_score
    end

    def self.highest_score_from(array_of_words)
      # provided_words_values = []
      #
      # array_of_words.each do |provided_word|
      #   value = Scrabble::Scoring.score(provided_word)
      #   provided_words_values << value
      # end

      scored_words_hash = {}

      array_of_words.each do |provided_word|
        score = Scrabble::Scoring.score(provided_word)
        scored_words_hash[provided_word] = score
        puts scored_words_hash
      end

      puts provided_words_values # [9, 5]
      # we want to find idx of highest value in provided_words_values array
      # we then want to find word in that same idx of the array_of_words

      # if tie:
      # fewest tiles used unless the other word used all 7 then that wins
      # if score & length are same for both high words, the first one wins

      # current_highest_word = ""

      puts provided_words_values.class # outputs "Array"
      puts array_of_words
    end # self.highest_score_from

    def breaking_ties()

=======
>>>>>>> aed0b5e8e6f8988a60476948250a483afda0347d
    end

  end # class Scoring
end # module Scrabble

# Scrabble::Scoring.score("kepts")
# Scrabble::Scoring.score("stamper")
# Scrabble::Scoring.score("")
# Scrabble::Scoring.score("$#&")
# Scrabble::Scoring.score("lalalalalalalala")
two_word_array = ["apple", "cat"]
Scrabble::Scoring.highest_score_from(two_word_array)
