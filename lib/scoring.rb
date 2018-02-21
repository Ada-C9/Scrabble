require 'awesome_print'
require 'pry'

module Scrabble

  class Scoring

    def self.score(word)
      total_score = 0
      scrabble_word = word.split(//)
      if scrabble_word.length > 7 || scrabble_word.length == 0
        return nil
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
      if scrabble_word.length == 7
        total_score += 50
      end
      return total_score
    end


    def self.highest_score_from(array_of_words)
    end

  end # class Scoring

end # module Scrabble



test_chart = Scrabble::Scoring.score('dlsdfaldjdsflkj')
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
