require "csv"
require "ap"

LETTER_VALUES = {
"A"=> 1 ,"E"=> 1,"I"=> 1,"O"=> 1,"U"=> 1,"L"=> 1,"N"=> 1,"R"=> 1,"S"=> 1,"T"=> 1,
"D"=> 2, "G"=> 2 , "B"=> 3,"C" => 3, "M" => 3 ,"P" => 3, "F"=> 4,"H"=> 4,"V"=> 4,"W"=> 4,"Y"=> 4,
"K"=> 5,  "J"=> 8, "X"=>8, "Q"=> 10, "Z"=> 10}


module Scrabble
  class Scoring

    def self.score(word)
      word_array = word.upcase.chars
      score = 0
      word_array.each do |letter|
        score += LETTER_VALUES[letter]
      end
      return score

    end

    def self.highest_score_from(array_of_words)
    end
  end
end

# letter_array_data = CSV.read("letter_values.csv")
# ap letter_array_data
# letter_values = {}
# count = 0
# until  count == letter_array_data.length - 1
#   letter_array_data.each do |letter|
#     letter_values[letter[0]] = letter.last
#     count +=1
#   end
# end
ap Scrabble::Scoring.score("dog")
