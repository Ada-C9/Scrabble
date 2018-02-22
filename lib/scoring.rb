module Scrabble
  class Scoring

    def self.score(word)
      total = 0
      array_of_characters = word.split('')
      if word.match(/^[a-zA-Z]{1,7}$/) == nil
        total = nil
      else
        array_of_characters.each do |letter|
          scrabble_value = letter.upcase
          case scrabble_value
            when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
              scrabble_value = 1
            when "D", "G"
              scrabble_value = 2
            when "B", "C", "M", "P"
              scrabble_value = 3
            when "F", "H", "V", "W", "Y"
              scrabble_value = 4
            when "K"
              scrabble_value = 5
            when "J","X"
              scrabble_value = 8
            when "Q", "Z"
              scrabble_value = 10
            end
            total = scrabble_value + total
          end
      end
      if array_of_characters.length == 7
        total = total + 50
      end
      return total
    end

    def self.highest_score_from(array_of_words)
      max = 0
      winner = nil
      short = 0
      if array_of_words.size == 0
        highest_score = nil
      elsif array_of_words.size == 1
        highest_score = array_of_words[0]
      end
      array_of_words.each do |word|
        if Scrabble::Scoring.score(word) > max
          max = Scrabble::Scoring.score(word)
          highest_score = word
        elsif Scrabble::Scoring.score(word) == max && word.length == 7
          max = Scrabble::Scoring.score(word)
          highest_score = word
        elsif Scrabble::Scoring.score(word) == max && highest_score.length !=7
          if highest_score.length > word.length
            highest_score = word
          end
        end
      end

      return highest_score
    end
  end
end
