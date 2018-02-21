module Scrabble
  class Scoring

    def self.score(word)
      points = 0

      if !/^[a-zA-Z]{1,7}$/.match(word)
        return nil
      end


      if word.length == 7
        points += 50
      end

      word.downcase!
      word.split("").each do |letter|
        case letter
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          points += 1
        when "d", "g"
          points += 2
        when "b", "c", "m", "p"
          points += 3
        when "f", "h", "v", "w", "y"
          points += 4
        when "k"
          points += 5
        when "j", "x"
          points += 8
        when "q", "z"
          points += 10
        end
      end
      return points
    end

    def self.highest_score_from(array_of_words)

      hashes_array = []

      array_of_words.each do |word|
        new_hash = {}
        new_hash[:word] = word
        new_hash[:length] = word.length
        new_hash[:score] = self.score(word)
        hashes_array << new_hash
      end

      winner_score = 0

      hashes_array.each do |word_hash|
        if word_hash[:score] > winner_score
          winner_score = word_hash[:score]
        end
      end

      seven_letters = []

      hashes_array.each do |word_hash|
        if word_hash[:score] != winner_score
          hashes_array.delete(word_hash)
        elsif word_hash[:length] == 7
          seven_letters << word_hash[:word]
        end
      end

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
