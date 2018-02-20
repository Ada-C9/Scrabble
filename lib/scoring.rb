module Scrabble
  class Scoring

    def initialize
      @scores = {
        1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        2 => ["D", "G"],
        3 => ["B", "C", "M", "P"],
        4 => ["F", "H", "V", "W", "Y"],
        5 => ["K"],
        8 => ["J", "X"],
        10 => ["Q", "Z"]
      }
    end

    def self.score(word)
      count = 0
        @scores.length.each do |key, value|
          count += @scores.key
        end
    end
  end
end

#     def self.highest_score_from(array_of_words)
#     end
#   end
# end
