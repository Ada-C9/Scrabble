require 'pry'

module Scrabble

  class Scoring
    def self.score(word)
      word = word.downcase
      letter_values = {
        ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
        ['d', 'g'] => 2,
        ['b', 'c', 'm', 'p'] => 3,
        ['f', 'h', 'v', 'w', 'y'] => 4,
        ['k'] => 5,
        ['j', 'x'] => 8,
        ['q', 'z'] => 10
      }
      max_word_length = 7
      if !word.match(/^[a-z]+$/)
        return nil
      else
        points_array = []
        word.chars.each do |char|
          letter_values.each do |letters, value|
            if letters.include?(char)
              points_array << value
            end
          end
        end
        points = points_array.inject(:+)

        if word.length > max_word_length
          return nil
        elsif word.length == max_word_length
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

      all_highscores = []

      word_hash.each do |word, score|
        if score == highscore
          all_highscores << word
        end
      end

      winner = all_highscores[0]
      if all_highscores.all? { |word| word.length == 7 }
        winner = all_highscores[0]
      else
        all_highscores.each do |word|
          if word.length == 7
            winner = word
          else
            if word.length < winner.length
              winner = word
            end
          end
        end
      end

      return winner
    end
  end
end
