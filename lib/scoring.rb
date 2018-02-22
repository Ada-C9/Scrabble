
module Scrabble
  class Scoring
    def self.score(word)
      total_score = 0

      # if statement to check if the word has bad characters and space
      if /[[\W][\s]+?]/.match(word)
        return nil
      end

      # if word only has good character then the below will execute
      scrabble_word = word.split(//)
      if scrabble_word.length > 7 || scrabble_word.length == 0
        return nil
      elsif scrabble_word.length == 7
        total_score += 50
      end

      scrabble_word.each do |letter|
        case letter.downcase
        when "a", "e", "i", "o", "u", "l", "n", "r", "s", "t"
          total_score += 1
        when "d", "g"
          total_score += 2
        when "b", "c", "m", "p"
          total_score += 3
        when "f", "h", "v", "w", "y"
          total_score += 4
        when "k"
          total_score += 5
        when "j", "x"
          total_score += 8
        when "q", "z"
          total_score += 10
        end
      end
      return total_score
    end
# look at ruby functions for pulling max

    def self.highest_score_from(array_of_words)

      array_of_words = ["apple", "cat", "answers", "right"]

      # array_of_words.map do | word |
      #
      #   word_hash[:word] = word
      #   word_hash[:length] = word.length
      #   word_hash[:score] = self.score(word)
      #   word_array << word_hash
      # end
      # # return word_array
      # array_of_words.max_by | word_hash|

      # scores = array_of_words.group_by { |word| score(word)}
      # highest_scoring_words = scores[scores.keys.max]
      # lengths = highest_scoring_words.group_by { |word| word.length}
      # return lengths[lengths.keys.min][0].upcase

<<<<<<< HEAD


      # max = 0
      # highest_word = “”
      # word_array.each do |scrabble_hash|
      #   # binding.pry
      #   if scrabble_hash[:score] > max
      #     max = scrabble_hash[:score]
      #     highest_word = scrabble_hash[:word]
      #   elsif scrabble_hash[:length] == 7
      #     return scrabble_hash[:word]
      #   end
      end
    end
  end
=======
    def self.highest_score_from(array_of_words)
      max_score = 0
      str = " "
      max_length = 8
      array_of_words.each do |word|
        if word.length == 7
          if Scrabble::Scoring.score(word) > max_score
            max_score = Scrabble::Scoring.score(word)
            str = word
          end
        elsif word.length < 7
          if Scrabble::Scoring.score(word) > max_score
            max_score = Scrabble::Scoring.score(word)
            max_length = word.length
            str = word
          elsif Scrabble::Scoring.score(word) == max_score && word.length < max_length
            max_score = Scrabble::Scoring.score(word)
            max_length = word.length
            str = word
          end
        end
      end
      return str
    end

    array = ["aeiou", "uoiea"]
     puts Scrabble::Scoring.highest_score_from(array)
    # puts Scrabble::Scoring.score("abcdefg")

    # array_of_words.each do |scrabble_word|
    #   word_hash = {}
    #   word_hash[:word] = scrabble_word
    #   word_hash[:length] = scrabble_word.length
    #   word_hash[:score] = self.score(scrabble_word)
    #   word_array << word_hash
    # end
    # # return word_array
    # max = 50
    # equal_to_7 = []
    # word_array.each do |scrabble_hash|
    #   # binding.pry
    #   if scrabble_hash[:score] > max
    #     equal_to_7 = scrabble_hash[:score]
    #     highest_word = scrabble_hash[:word]
    #   elsif scrabble_hash[:length] == 7
    #     return scrabble_hash[:word]
    #   end
  end
end
>>>>>>> 3d165a6168275940476c1734bbc6a1f4b8c93066
