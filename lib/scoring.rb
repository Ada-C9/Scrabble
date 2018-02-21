module Scrabble
  class Scoring
    def self.score(word)
      word = word.downcase
      letters_array = word.split(//)
      total = 0

      # returns nil if word > 7 letters
      if letters_array.length > 7
        return nil
      end

      # returns nil if word is empty
      if letters_array.empty?
        return nil
      end

      # original word score
      letters_array.each do |letter|
        if ("a".."z").cover?(letter)
          case
          when letter == "d" || letter == "g"
            total += 2
          when letter == "b" || letter == "c" || letter == "m" || letter == "p"
            total += 3
          when letter == "f" || letter == "h" || letter == "v" || letter == "w" || letter == "y"
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
        else
          return nil
        end
      end

      # word-length scoring bonus
      if letters_array.length == 7
        total += 50
      end

      return total
    end

    def self.highest_score_from(array_of_words)
      array_of_words = array_of_words
      highest_word = ""
      highest_score = 0

      if array_of_words.empty?
        return nil
      end

      if array_of_words.length == 1
        return array_of_words[0]
      end

      array_of_words.each do |word|
        value = Scrabble::Scoring.score(word)
        if value > highest_score
          highest_score = value
          highest_word = word

        elsif (value == highest_score) && (word.length == 7)
          highest_word = word
          highest_score = value
          
        end
      end
      puts highest_word
      return highest_word


    end
  end
end

puts Scrabble::Scoring.score("kk")
puts Scrabble::Scoring.score("aeirfd")
puts Scrabble::Scoring.score("aaaaak")
puts Scrabble::Scoring.score("dog")
Scrabble::Scoring.highest_score_from(["aaaaak","kk", "aaaaek", "aeirfd"])
