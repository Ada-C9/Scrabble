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

      # letters = {
      #   "A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,
      #   "D" => 2, "G" => 2,
      #   "B" => 3, "C" => 3, "M" => 3, "P" => 3,
      #   "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4,
      #   "K" => 5, "J" => 8, "X" => 8,
      #   "Q" => 10, "Z" => 10
      # }

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
    #   @word_array.each do |element|
    #     count = 0
    #     if element == " "
    #       @word_total_points = nil
    #       return @word_total_points
    #     elsif
    #       letters.each do |key, value|
    #         if element == key
    #           @word_total_points += value
    #           count += 1
    #         end
    #       end
    #
    #       if count != element.length
    #         return @word_total_points = nil
    #       end
    #       return @word_total_points
    #     end
    #       return @word_total_points
    #   end


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


# ap Scrabble::Scoring.score("aaaaa")
