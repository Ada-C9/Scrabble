require "pry"

module Scrabble
  class Scoring

    LETTER_SCORES = { "a" => 1,"b" => 3,"c" => 3,"d" => 2,"e" => 1,"f" => 4,"g" => 2,"h" => 4,
      "i" => 1,"j" => 8,"k" => 5, "l" => 1,"m" => 3,"n" => 1,"o" => 1,"p" => 3,
      "q" => 10, "r" => 1, "s" => 1, "t" => 1, "u" => 1, "v" => 4, "w" => 4,
      "x" => 8, "y" => 4, "z" => 10 }
    def self.score(word)
      points = 0

      if !/^[a-zA-Z]{1,7}$/.match(word)
        return nil
      end


      if word.length == 7
        points += 50
      end


      word.downcase!
      score_array = word.split("").map do |letter|
        LETTER_SCORES[letter]
      end

      points = score_array.inject(points,:+)

      return points
    end

    def self.get_hash(array_of_words)

      hashes_array = array_of_words.map do |word|
        {
          word: word,
          length: word.length,
          score: self.score(word)
        }
      end

      # hashes_array = []
      #
      # array_of_words.each do |word|
      #   new_hash = {}
      #   new_hash[:word] = word
      #   new_hash[:length] = word.length
      #   new_hash[:score] = self.score(word)
      #   hashes_array << new_hash
      # end
      return hashes_array
    end

    def self.get_winner_score(hashes_array)
      winner_score = 0

      hashes_array.each do |word_hash|
        if word_hash[:score] > winner_score
          winner_score = word_hash[:score]
        end
      end
      return winner_score
    end

    def self.get_winner_hashes(hashes_array, winner_score)
      # seven_letters = []

      hashes_array.each do |word_hash|
        if word_hash[:score] != winner_score
          hashes_array.delete(word_hash)
        end
      end
      return hashes_array

    end

    def self.seven_letters(hashes_array)
      seven_letters = []
      hashes_array.each do |word_hash|
        if word_hash[:length] == 7
          seven_letters << word_hash[:word]
        end
      end
      return seven_letters
    end

    def self.highest_score_from(array_of_words)
      hashes_array = self.get_hash(array_of_words)

      winner_score = self.get_winner_score(hashes_array)

      hashes_array = self.get_winner_hashes(hashes_array, winner_score)

      seven_letters = self.seven_letters(hashes_array)

      winner = nil
      max_length = 7

      if seven_letters.length > 0
        winner = seven_letters[0]

        # if there are no 'winner possibilities' with length = 7
      else
        hashes_array.each do |word_hash|
          if word_hash[:length] < max_length
            winner = word_hash[:word]
            max_length = word_hash[:length]
          end
        end # iterating through hashes_array

      end # if 7 length words else "blah"

      return winner

    end # Method highest_score_from

  end # Class Scoring
end # Module Scrabble


# Scrabble::Scoring.score("academy")
