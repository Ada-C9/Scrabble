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

      # Create & Populate array of words:
      winning_word_array = []
      if array_of_words == []
        return nil
      elsif array_of_words.length == 1
        winning_word_array << array_of_words
        return winning_word_array[0]
      elsif  array_of_words.max_by(&:length).length == 7
        win_word = array_of_words.max_by(&:length)
        return win_word
      else
        win_word = array_of_words.min_by  {|word| word.length}
        return win_word
      end
    end
    
  end
end
