module Scrabble
  class Scoring
    def self.score(word)
      @word = word
      @letters_array = @word.split(//)
      total = 0
      @letters_array.each do |letter|
        case
        when letter == "d" || letter == "g"
          total += 2
        when letter == "b" || letter == "c" || letter == "m" || letter == "p"
          total += 3
        when letter == "f" || letter == "h" || letter == "v" || letter == "w" || letter == "Y"
          total += 4
        when letter == "k"
          total += 5
        when letter == "j" || letter == "x"
          total += 8
        when letter == "q" || letter == "z"
          total += 10
        else
          total += 1
        end
      end
        puts total
        return total
    end

    def self.highest_score_from(array_of_words)
    end
  end
end

Scrabble::Scoring.score("dog")
