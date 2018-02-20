require 'awesome_print'

module Scrabble
  class Scoring
    def self.score(word)

    #if word qualifies: a-z, A-Z, 7 letters max
    #50 bonus points for 7-letter words
     # input =~ /^[A-Z]{7}$/i


      @word_array = word.upcase.split("")
      @word_total_points = 0

      # if @word_array

      # one_points = %W(A E I O U L N R S T)
      # two_points = %W(D G)

      one_points = ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"]
      two_points = ["D", "G"]
      three_points = ["B", "C", "M", "P"]
      four_points = ["F", "H", "V", "W", "Y"]
      five_points = ["K"]
      eight_points = ["J", "X"]
      ten_points = ["Q", "Z"]

      @word_array.each do |letter|
        ap letter
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

    # def self.highest_score_from(array_of_words)
    # end
  end
end



ap Scrabble::Scoring.score("cat pig")
