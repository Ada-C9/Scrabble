module Scrabble

  class Scoring

    LETTERVALUES = {
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

    attr_accessor :word


    #     class Post
    #   STATUS = Hash.new{ |hash, key| raise( "Key #{ key } is unknown" )}.update(
    #     :draft => "draft",
    #     :awaiting_review => "awaiting review",
    #    :posted => "posted" )
    # end
    def initialize(word)
      @word = word
    end

    def self.score(word_to_score)
      # take argument & convert to upcase
      @word = word_to_score.upcase
      # split argument in an array of letters
      letter_array = @word.split('')
      values_of_letters = []
      # check each letter of input against constant Hash and return the value of that key
      letter_array.each do |letter|
        letter = letter.to_sym
        if LETTERVALUES.has_key?(letter)
          tile_value = LETTERVALUES[letter]
          values_of_letters << tile_value
        end
        # store the returned values in an array.
        # values_of_letters << LETTERVALUES[letter]
      end
      # calculate and return sum
      sum = values_of_letters.sum
    end

    def self.highest_score_from(array_of_words)
    end

  end

end



#
