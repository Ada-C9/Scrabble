module Scrabble
  class Scoring
    def self.score(word)
      score = 0
      return nil if word.size > 7 || word.size == 0
      letters = word.split("")
      letters.each do |letter|
        letter_score = score_value(letter.upcase)
        return if letter_score.nil?
        score += letter_score
      end
      score += 50 if letters.size == 7
      return score
    end

    def self.score_value(letter)
      one_point = %w[A E I O U L N R S T]
      three_points = %w[B C M P]
      four_points = %w[F H V W Y]
      if one_point.include?(letter)
        1
      elsif letter == "D" || letter == "G"
        2
      elsif three_points.include?(letter)
        3
      elsif four_points.include?(letter)
        4
      elsif letter == "K"
        5
      elsif letter == "J" || letter == "X"
        8
      elsif letter == "Q" || letter == "Z"
        10
      end
    end

    def self.highest_score_from(array_of_words)
      return if array_of_words.length == 0
      highest_score = 0
      winning_words = []
      array_of_words.each do |word|
        score = score(word)
        next if score < highest_score
        if score > highest_score
          winning_words = []
          highest_score = score
        end
        winning_words << word
      end
      return winning_words.size == 1 ?  winning_words.pop : break_tie(winning_words)
    end

    def self.break_tie(winning_words)
      word_size = 7
      winning_word = ""
      winning_words.each do |word|
        return word if word.size == 7
        next if word.length > word_size
        if word.length < word_size
          word_size = word.length
          winning_word = word
        end
      end
      winning_word
    end


  end
end
