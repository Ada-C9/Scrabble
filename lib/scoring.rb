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
        score += 3
      when 'F', 'H', 'V', 'W', 'Y'
        score += 4
      when 'K'
        score += 5
      when 'J', 'X'
        score += 8
      when 'Q', 'Z'
        score += 10
        return nil

        # else
        #   score = nil
      end
      return score
    end

    # def is_a_letter?(input)
    #   input =~ /[A-Z]/
    # end

    def self.score(word)
      if word == "" || word == " "
        return nil
      end

      score = 0
      letters_in_word = word.upcase.split(//)

      score += 50 if letters_in_word.length == 7

      return nil if
      letters_in_word.length > 7

      letters_in_word.each do |letter|
        if !(letter =~ /[A-Z]/)
          return nil
        end
        score += letter_score(letter)
      end
      return score
    end

    def self.highest_score_from(array_of_words)
      if array_of_words.length <= 0
        return nil
      elsif array_of_words.length == 1
        return array_of_words[0]
      end

      word_score = {}
      array_of_words.each do |word|
        word_score[word] = score(word)
      end
      tie = []
      max_score = word_score.values.max
      word_score.each do |word, score|
        score >= max_score ? tie << word : nil
      end
      tie_winner(tie) if tie.length >= 1
      #return tie[0]
    end

    def self.tie_winner(tie)
      tie_winner = ""
      most_letters = tie[0].length
      tie.each do |word|
        if word.length > most_letters
          most_letters = word.length
          tie_winner += word
        end
      end
      return tie_winner
    end

      #word_score.key(word_score.values.max) #this does the same thing was what we had, but not what we want
  end
end
# Scrabble::Scoring.score('cat') #dan example

binding.pry
