module Scrabble
  class Scoring
    letter_values =
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
      # Split the word into its indvidual letters and store in array
      user_word = word.split(//)
      # iterate over each letter
      user_word.each do |letter|
        letter.to_sym
        if letter_values.include_key?(letter)
          word_total += letter_values[:letter]
        end
        return word_total 
      end
    end

    def self.highest_score_from(array_of_words)
    end
  end
end
