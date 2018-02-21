require 'awesome_print'

module Scrabble
  class Scoring
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

    def self.highest_score_from(array_of_words)
      max_points = 0
      max_point_word = nil
      array_of_words.each do |word|
        value = self.score(word)
        if value != nil
          if value > max_points
            max_points = value
            max_point_word = word
          end
        end
      end
      return max_point_word
    end
  end
end


ap Scrabble::Scoring.highest_score_from(["aaaaaaaaaaaaa"])















#
