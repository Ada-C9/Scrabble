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
    end
  end
  # end
end
