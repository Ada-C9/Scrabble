require 'awesome_print'
require 'pry'

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


    def self.highest_score_from(array_of_words)
      # word_scores = []
      # word_index = []
      if array_of_words.length == 0
        return nil
      elsif array_of_words.length == 1
        return array_of_words[0]
      elsif array_of_words.length > 1
        top_score = 0
        top_word = []
        array_of_words.each do |word|
          # word_hash = {}
          # word_hash[word]= self.score(word)
          if self.score(word) >= top_score
            top_score = self.score(word)
            top_word << word
          end
          if top_word.length == 1
            return top_word[0]
          else
            if top_word[0] < top_word[1]
              return top_word[0]
            else
              return top_word[1]
            end
          end
        end
      end # if statement
    end # def self.highest_score_from(array_of_words)

  end # class Scoring
end # module Scrabble


        # return word_array
        # word_array.each do |scrabble_hash|
        #   scrabble_hash.value.group_by do |:score|
        #     if :score =
        #   end
        # end
        #
        # new_hash_word = word_array.group_by do |scrabble_hash|
        #   scrabble_hash[:score].max
        # end
        # return new_hash_word
        #
        # hash_word_score = word_array.max_by do |scrabble_hash|
        #   scrabble_hash[:score]
        # end
        # return hash_word_score[:word]
        #
        # word_array.each do |scrabble_hash|
        #   hash_word_full_7_letters = ''
        #   if scrabble_hash[:length] == 7
        #     hash_word_full_7_letters = scrabble_hash[:word]
        #   end
        # end
        # return hash_word_full_7_letters
        #
        # hash_word_min = word_array.min_by do |scrabble_hash|
        #   scrabble_hash[:length]
        # end
        # return hash_word_min[:word]

        # array_of_words.each do |word|
        #   word_scores << self.score(word)
        #   max_value = word_scores.max
        #   word_index = word_scores.map do |index|
        #       word_scores[index] == max_value
        #   end
        # end
        # binding.pry
        # return word_index
        # return array_of_words[word_scores.index(word_scores.max)]

        # def group_by_hash hash, value
        #   hash.group_by do |k,v|
        #     v > value ? "Big" : "Small"
        #   end
        # end









# test_chart = Scrabble::Scoring.score('')
# ap test_chart

test_chart = Scrabble::Scoring.highest_score_from(["cat", "dog"])
ap test_chart
# binding.pry


# # array reference
# scrabble_chart = [
#   { 1 => %w[A E I O U L N R S T a e i o u l n r s t] },
#   { 2 => %w[D G d g]},
#   { 3 => %w[B C M P b c m p]},
#   { 4 => %w[F H V W Y f h v w y]},
#   { 5 => %w[K k]},
#   { 8 => %w[J X j x]},
#   { 10 => %w[Q Z q z]}
# ]
# ap scrabble_chart[0].values[0][0]
