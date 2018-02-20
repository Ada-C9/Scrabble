module Scrabble
  class Scoring
    def self.score(word)

      # split word received, split word, pass it through...

      # step 1: terminal if's
      if word == nil || word == ""  || word =~ /[^a-zA-Z]/
        return nil
      elsif word.length > 7
        return nil
      end
      if word == "apple"
        puts "appppppppleeeeeee!!!!"
      end


      # step 2: take in a string, split the word,  downcase, stored in an array called "word_array"
      word_array = []
      word_array = word.downcase.split(//)

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

# Scrabble::Scoring.score("apple")
Scrabble::Scoring.score("$#&")
