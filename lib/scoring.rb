require 'awesome_print'

module Scrabble
  class Scoring
    def self.score(word)
      @word_array = word.upcase.split("")
      @word_total_points = 0
      one_points = %W(A E I O U L N R S T)
      two_points = %W(D G)
      three_points = %W(B C M P)
      @word_array.each do |letter|
        if one_points.include?(letter)
          @word_total_points += 1
        elsif two_points.include?(letter)
          @word_total_points += 2
        end
      end
      return @word_total_points
    end


  end

  def self.highest_score_from(array_of_words)
  end
end
