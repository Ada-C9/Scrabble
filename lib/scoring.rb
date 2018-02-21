module Scrabble
  class Scoring
    @@letter_values =
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
          user_word.length > 7
          return nil
        end
        # iterate over each letter
        user_word.each do |letter|
          letter = letter.to_sym
          if @@letter_values.has_key?(letter)
            word_total += @@letter_values[letter]
          end
        end
        return word_total
      else
        return nil
      end
    end


    def self.highest_score_from(array_of_words)
    end
  end
end
