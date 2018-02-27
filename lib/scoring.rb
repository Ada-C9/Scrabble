require 'awesome_print'

module Scrabble
  class Scoring
    attr_reader :word_total_points

    def self.score(word)
      @word_array = word.upcase.split("")
      if @word_array.length < 1 || @word_array.length > 7
        return nil
      elsif @word_array.length == 7
        @word_total_points = 50
      else
        @word_total_points = 0
      end

      one_points = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
      two_points = ["D", "G"]
      three_points = ["B", "C", "M", "P"]
      four_points = ["F", "H", "V", "W", "Y"]
      five_points = ["K"]
      eight_points = ["J", "X"]
      ten_points = ["Q", "Z"]

      @word_array.each do |letter|
        if one_points.include?(letter)
          @word_total_points += 1
        elsif two_points.include?(letter)
          @word_total_points += 2
        elsif three_points.include?(letter)
          @word_total_points += 3
        elsif four_points.include?(letter)
          @word_total_points += 4
        elsif five_points.include?(letter)
          @word_total_points += 5
        elsif eight_points.include?(letter)
          @word_total_points += 8
        elsif ten_points.include?(letter)
          @word_total_points += 10
        elsif letter == " "
          @word_total_points = nil
          return @word_total_points
        else
          @word_total_points = nil
          return @word_total_points
        end
      end
      return @word_total_points
    end

    def self.tie_breaker(current_winner, word) #in class
      if word.length == 7 && current_winner.length <7
        return word
      elsif word.length < current_winner && current_winner != 7
        return word
      else
        return current_winner
      end
    end

    def self.highest_score_from(array_of_words)
      # max_points = 0
      # max_point_word = nil
      # max_word_length = 0
      #
      # # array_of_words.each do |word|
      # #   value = self.score(word)
      # #
      # #   if value != nil
      # #     if value > max_points
      # #       max_points = value
      # #       max_point_word = word
      # #       max_word_length = word.length
      # #     elsif value = max_points && word.length = 7 max_word_length
      # #       max_points = value
      # #       max_point_word = word
      # #       max_word_length = word.length
      # #     elsif value = max_points && word.length
      # #     end
      # #   end
      # # end
      #
      # array_of_words.each do |word|
      #   value = self.score(word)
      #   if value != nil
      #
      #     if word.length == 7 && value >= max_points
      #       max_points = value
      #       max_point_word = word
      #       max_word_length = 7
      #       if word.length < 7 && value > max_points
      #         max_points = value
      #         max_point_word = word
      #         max_word_length = word.length
      #         if value > max_points && word.length > max_word_length
      #           max_points = value
      #           max_point_word = word
      #           max_word_length = word.length
      #
      #         end
      #       end
      #     end
      #     return max_point_word


      #in class
      if array_of_words != Array || array_of_words.empty?
        return nil
      end
      scores = {}
      array_of_words.each do |current_word|
        current_score = Scrabble::Scoring.new(current_word)
        if scores[current_score] == nil
          scores[current_word] = [current_word]
        else
          scores[current_score] << current_word
        end
      end

      max_score = scores.keys.max

      current_winner = scores[max_score].first

      seven_letter_word = scores[max_score].find do |word|
        word.length == 7
      end

      # if seven_letter_word #an alternate
      #   return seven_letter_word
      # end
      scores[max_score].each do |word|
        current_winner = tie_breaker(current_winner, word)
      end
      # max_value = 0
      # max_value_word_length = 8
      # # max_value_word
      #
      #
      #   array_of_words.each do |word|
      #     value = self.score(word)
      #     if value != nil
      #     if value >= max_value
      #       max_value = value
      #       if max_value_word_length > word.length
      #         max_value_word_length = word.length
      #         max_value_word = word
      #       end
      #     end
      #   end
      #   return max_value_word
      # end
    end
  end
end





# ap Scrabble::Scoring.score("aaaaa")
