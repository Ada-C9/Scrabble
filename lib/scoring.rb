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

      array_winners = []
      hash_of_scores.each do |word, score|
        if score == winner_score
          array_winners << word
        end
      end

      winner = nil

      max_length = 7

      if array_winners.length == 1
        winner = array_winners[0]
      else
        array_winners.each do |word|
          if word.length == 7 # && winner == nil
            winner = word
          elsif word.length < max_length
            winner = word
            max_length = word.length
          end
        end
      end

      return winner
    end # Method highest_score_from

  end # Class Scoring
end # Module Scrabble
