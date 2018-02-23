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
      end
      return score
    end

    def self.score(word)
      score = 0
      letters = word.upcase.split(//)

      return nil if letters.length > 7 || letters.length == 0

      score += 50 if letters.length == 7

      letters.each do |letter|
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

      max_keys = []
      word_score.each do |key, value|
        if value == word_score.values.max
          max_keys << key
        end
      end

      if max_keys.length == 1
        return word_score.key(word_score.values.max)
      else
        tie_winner(max_keys)
      end

    end

    def self.tie_winner(words)
      word_length = {}
      words.each do |word|
        word_length[word] = word.length
      end
      if word_length.has_value? 7
        return word_length.key(7)
      else
        return word_length.key(word_length.values.min)
      end
    end

  end

end 
