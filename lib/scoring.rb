require 'pry'

module Scrabble
  class Scoring

    @letters = {
      "A"=>1,
      "B"=>3,
      "C"=>3,
      "D"=>2,
      "E"=>1,
      "F"=>4,
      "G"=>2,
      "H"=>4,
      "I"=>1,
      "J"=>8,
      "K"=>5,
      "L"=>1,
      "M"=>3,
      "N"=>1,
      "O"=>1,
      "P"=>3,
      "Q"=>10,
      "R"=>1,
      "S"=>1,
      "T"=>1,
      "U"=>1,
      "V"=>4,
      "W"=>4,
      "X"=>8,
      "Y"=>4,
      "Z"=>10
    }


    def self.score(word)
      if word.class != String || word.length > 7 || word.length == 0
        return nil
      else
        word_value = 0
        word_split = word.upcase.split(//)
        word_split.each do |one_letter|
          if @letters.has_key?(one_letter)
            word_value += @letters[one_letter]
          else
            return nil
          end
        end
      end
      if word_split.length >= 7
        word_value += 50
      end
      return word_value
    end


    def self.highest_score_from(array_of_words)
      if array_of_words == []
        return nil
      elsif array_of_words.length == 1
        return array_of_words[0]
      else
        array_of_words.length.times do
          @words_scores = {}
          array_of_words.each do |word|
            total = score(word)
            @words_scores[word] = total
          end

          tied_words = []

          @words_scores.each do |word, value|
            if value == @words_scores.values.max
              tied_words << word
            end
          end

          winner = ""
          tied_words.each do |word|
            if word.length == 7
              winner = word
            else
              winner = tied_words.min{|word1,word2| word1.length <=> word2.length}
            end
          end
          return winner
        end

      end
    end
  end
  # end
end
