require 'pry'

module Scrabble
  class Scoring
    # LETTERS = {
    #   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    #   2 => ["D", "G"],
    #   3 => ["B", "C", "M", "P"],
    #   4 => ["F", "H", "V", "W", "Y"],
    #   5 => ["K"],
    #   8 => ["J", "X"],
    #   10 => ["Q", "Z"]
    # }
    def self.score(word) # 'dog'
      word = word.upcase
      word_array = word.split('') #['D', 'O', 'G']
      total_score = 0

      if word_array.length > 7 || word_array.length < 1
        return total_score = nil
      else
        # add 50 pts if the word is 7 letters long
        total_score += 50 if word_array.length == 7
        word_array.each do |letter|
          # letter_points = LETTERS.find { |key, values|
          #   values.include?(letter)
          # }.first
          # total_score += letter_points

          case letter
          when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
            total_score += 1
          when "D", "G"
            total_score += 2
          when "B", "C", "M", "P"
            total_score += 3
          when "F", "H", "V", "W", "Y"
            total_score += 4
          when "K"
            total_score += 5
          when "J", "X"
            total_score += 8
          when "Q", "Z"
            total_score += 10
          else
            total_score = nil
          end # case letter
        end # word_array.each
        return total_score
      end # if > 7 statement
    end # self.score method

    def self.highest_score_from(array_of_words)
      return nil if array_of_words == []
      return array_of_words[0] if array_of_words.length == 1

      max_score = 0
      winning_word = []
      # length_to_beat = 7

      array_of_words.each do |word| #[dog, fish]
        word_score = self.score(word)
        if word_score == max_score
          winning_word << word
        elsif word_score > max_score
          max_score = word_score
            winning_word = [word]
        end # if else
      end # array_of_words.each


        if winning_word.length > 1
          winning_word.sort_by { |word| word.length}
        end
        return winning_word[0]

        #   winning_word.each do |word|
        #     if word.length == length_to_beat
        #       return winning_word
        #     elsif word.length < length_to_beat
        #       length_to_beat = word.length
        #       winning_word.delete(word)
        #     else
        #       winning_word.delete(word)
        #       return winning_word
        #     end #wrd_lngt == length_to_beat
        #   end # winning_word.each
        # end # winning_word.length > 1

      # max = Hash[score_tracker.select { |k, v| v == score_tracker.values.max}]
      # max.each do |k,v|
      #   if max.length > 1
      #     unless k.length == 7
      #       return k.length.min
      #       binding.pry
      #     end # unless k.length
      #   end # if max.length
      # end # max.each
      # score_tracker.each {|k,v|return k if v == score_tracker.values.max}
    end # self.highest_score_from
  end # Scoring class
end # Scrabble module

array_of_words = ["dog", "fish"]
puts Scrabble::Scoring.highest_score_from(array_of_words)
