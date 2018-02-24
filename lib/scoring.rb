require 'pry'

module Scrabble
  MAX_WORD_LENGTH = 7

  LETTER_VALUES = {
    ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
    ['d', 'g'] => 2,
    ['b', 'c', 'm', 'p'] => 3,
    ['f', 'h', 'v', 'w', 'y'] => 4,
    ['k'] => 5,
    ['j', 'x'] => 8,
    ['q', 'z'] => 10
  }

  class Scoring
    def self.score(word)
      if word == nil || !word.match(/^[a-zA-Z]+$/)
        return nil
      else
        word = word.downcase
        points_array = []
        word.chars.each do |char|
          LETTER_VALUES.each do |letters, value|
            if letters.include?(char)
              points_array << value
            end
          end
        end
        points = points_array.inject(:+)

        if word.length > MAX_WORD_LENGTH
          return nil
        elsif word.length == MAX_WORD_LENGTH
          points += 50
        end

        return points
      end
    end # self.score

    def self.highest_score_from(array_of_words)
      word_hash = Hash.new
      array_of_words.each do |word|
        word_hash[word] = score(word)
      end
      highscore = word_hash.values.max

      all_highscores = word_hash.select { |word, score| score == highscore }.keys

      winner = all_highscores[0]
      if all_highscores.any? { |word| word.length == MAX_WORD_LENGTH }
        seven_letter_score = all_highscores.select { |word|
          word.length == MAX_WORD_LENGTH }
        winner = seven_letter_score[0]
      else
        all_highscores.each do |word|
          if word.length < winner.length
            winner = word
          end
        end
      end
      return winner
    end
  end
end
