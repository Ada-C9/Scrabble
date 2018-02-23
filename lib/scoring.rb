require 'pry'
module Scrabble
  class Scoring
    LETTER_VALUES =
    {
      :A => 1,
      :E => 1,
      :I => 1,
      :O => 1,
      :U => 1,
      :L => 1,
      :N => 1,
      :R => 1,
      :S => 1,
      :T => 1,
      :D => 2,
      :G => 2,
      :B => 3,
      :C => 3,
      :M => 3,
      :P => 3,
      :F => 4,
      :H => 4,
      :V => 4,
      :W => 4,
      :Y => 4,
      :K => 5,
      :J => 8,
      :X => 8,
      :Q => 10,
      :Z => 10
    }

    def self.score(word)
      # Check word for invalid characters
      if !/[^a-zA-Z]+/.match(word)
        # Split the word into its indvidual letters and store in array
        user_word = word.upcase.split(//)
        # Adds 50 points for 7 letter words
        word_total = 0
        # checks if word length is equal to seven and adds 50 pts
        if user_word.length == 7
          word_total += 50
        elsif
          # checks if word length is greater then 7, and returns nil
          user_word.length > 7 || user_word.length == 0
          return nil
        end
        # iterate over each letter
        user_word.each do |letter|
          letter = letter.to_sym
          if LETTER_VALUES.has_key?(letter)
            word_total += LETTER_VALUES[letter]
          end
        end
        return word_total
      else
        return nil
      end
    end


    def self.highest_score_from(array_of_words)
      # RETURNS NIL FOR EMPTY ARRAY
      if array_of_words.length == 0
        return nil
        # RETURNS WORD FROM ARRAY LENGTH 1
      elsif array_of_words.length == 1
        return array_of_words[0]
      else
        scores = []
        array_of_words.each do |word|
          scores << Scrabble::Scoring.score(word)
        end
        highest_score = scores.max
        highest_words = []
        longest_word = nil
        array_of_words.each do |word|
          if Scrabble::Scoring.score(word) == highest_score
            highest_words << word
          end
          # binding.pry
          # sorts through words depending on length
          longest_word = highest_words.sort_by do |word| word.length
            if word.length == 7
              longest_word = word
              return longest_word
              # if length is not 7 returns the shortest word
            elsif word.length < 7
              longest_word = word
              return longest_word
            end
          end
        end
      end
    end
  end
end
