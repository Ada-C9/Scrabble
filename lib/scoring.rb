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
      hash_of_scores = {}
      array_of_words.each do |word|
        hash_of_scores[word] = self.score(word)
      end
      winner_score = hash_of_scores.values.max
      return hash_of_scores.key(winner_score)
    end # Method highest_score_from

  end # Class Scoring
end # Module Scrabble
