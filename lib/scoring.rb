module Scrabble
  class Scoring
    def self.score(word)


      word_score = 0


        if word.include? 'd'
          word_score += 2
        end

        if word.include? 'o'
          word_score += 1
        end

        if word.include? 'g'
          word_score += 2
        end


      return word_score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end
