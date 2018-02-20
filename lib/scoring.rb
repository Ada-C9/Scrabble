require 'pry'


module Scrabble
  class Scoring
    def self.letter_score(letter)
      score = 0
      case letter
      when  'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'
        score += 1
      when 'D', 'G'
        score += 2
      when 'B', 'C', 'M', 'P'
        score +=	3
      when 'F', 'H', 'V', 'W', 'Y'
        score += 4
      when 'K'
        score +=	5
      when 'J', 'X'
        score +=	8
      when 'Q', 'Z'
        score += 10
        # else
        #   score = nil
      end
      return score
    end

    # def is_a_letter?(input)
    #   input =~ /[A-Z]/
    # end

    def self.score(word)
      score = 0

      letters_in_word = word.upcase.split(//)

      score += 50 if letters_in_word.length == 7

      return nil if
      letters_in_word.length > 7 ||
      letters_in_word.length == 0

      letters_in_word.each do |letter|
        if !(letter =~ /[A-Z]/)
          return nil
        end
        score += letter_score(letter)
      end
      return score
    end

    def self.highest_score_from(array_of_words)
      word_score = {}
      array_of_words.each do |word|
        word_score[word] = score(word)
      end

      if word_score = []
        retutn nil
      else
        max_score = 0
        word_score.each do |word, score|
          if score > max_score
            max_score = score
          end
        end
        return word_score[max_score]
      end
    end
  end
end

# Scoring::Scrabble.scoring('cat') #dan example
