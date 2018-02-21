module Scrabble
  class Scoring

    def self.score(word)
      @all_letters = {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10
      }
      # total_points = 0
      word = word.upcase
      letters = word.split("")

      values_of_letters = []

      letters.each do |letter|
        #.fetch - could help bad characters
         values_of_letters << @all_letters.fetch(letter)
       end

       sum = values_of_letters.sum
       return sum

    end
  end
end

#     def self.highest_score_from(array_of_words)
#     end
#   end
# end
