require 'awesome_print'

module Scrabble
  class Scoring
    def self.score(word)
      word = word.downcase
      letters_array = word.split(//)

      score = 0
      letters_array.each do |letter|
        case letter
        when "a" ,"e","i","o", "u", "l", "n", "r" ,"s","t"
          score += 1
        when "d", "g"
          score += 2
        when "b","c","m","p"
          score += 3
        when "f", "h", "v", "w", "y"
          score += 4
        when "k"
          score += 5
        when "j", "x"
          score += 8
        when "q", "z"
          score += 10
        else
          return nil
        end
      end

      if letters_array.length == 7
        return score + 50
      elsif letters_array.length > 7
        return nil
      end
      if score == 0
        return nil
      end

      return score
    end

    def self.highest_score_from(array_of_words)
      if array_of_words.length == 1
        return array_of_words[0]
      end

      scores_array = []
      if array_of_words.length == 2
        array_of_words.each do |word|
        score =  Scrabble::Scoring.score(word)
        scores_array << score
      end
       return scores_array.max


      end


    end
  end
end
