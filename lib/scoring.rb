require 'pry'
# require_relative '../lib/player'

module Scrabble
  class Scoring

    SCORE_CHART = {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10
    }


    def self.score(word)

      if (/\W/ =~ word.upcase) == nil #if letter_array contains only letters, it will return the score and continue

        letter_array = word.upcase.split(//)  #this will give an array of strings

        score = 0

        if letter_array.count == 7
          score += 50
        elsif letter_array.count > 7 || letter_array.length == 0
          return nil
        end

        letter_array.each do |letter|
          #if the letter matches a key in the score_chart hash, return value, add that value to variable, varible will start at zero

          if SCORE_CHART.has_key? (letter)
            score += SCORE_CHART[letter]
          end
        end
        return score
      else # the letter_array contained any special character/ number and stops.
        return nil
      end
    end #end of scoring method


    # HIGHEST SCORING WORD
    def self.highest_score_from(array_of_words)
      score_array =[] #this array stores the score integers
      # binding.pry
      array_of_words.each do |word|

        score_array << Scrabble::Scoring.score(word)
      end

      max_value = score_array.max

      if score_array.count(max_value) > 1
        #if there there's more than one max value in score array, then we will figure out which has the smallest letter count. (if not, continue to the else at line 95)
        tied_words = [] #an array of words with matching max values

        #each_index passes the index of the element (not the element itself)
        score_array.each_index do |index|
          if score_array[index] == max_value
            #if the value at the index matches max_value it will be stored in the tied_words array
            tied_words << array_of_words[index]
          end
        end

        smallest_word = tied_words[0]

        tied_words.each do |word|
          if word.length < smallest_word.length
            #if current word length is smaller than smallest_word.length it will replace value of smallest_word
            smallest_word = word
          end
        end

        return smallest_word.upcase

      else
        if score_array.empty?
          return nil
        else
          # binding.pry
          winning_word = array_of_words[score_array.index(score_array.max)].upcase
          # array_of_words[0].upcase
          # finds the index of the max value of score array and it should be the same as the index of array_of_words, then upcase for consistency.
          # binding.pry

          return winning_word

        end
      end
    end # end of method

  end #end of class
end #end of module
