module Scrabble
  class Scoring

    def self.score(word)

      # step 1: handling "terminal if's" that return nil
      if word == nil || word == ""  || word =~ /[^a-zA-Z]/
        return nil
      elsif word.length > 7
        return nil
      end

      # step 2: take input as a string, split the word, downcase it, stored in an array called "letter_array"
      letter_array = []
      letter_array = word.downcase.split(//)
      # SCORECARD AKA 'provided_words_values'
      value_1_array = ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"]
      value_2_array = ["d", "g"]
      value_3_array = ["b", "c", "m", "p"]
      value_4_array = ["f", "h", "v", "w", "y"]
      value_5_array = ["k"]
      value_8_array = ["j", "x"]
      value_10_array = ["q", "z"]

      # Give 50 extra points to a valid word with 7 letters
      if letter_array.length == 7
        word_score = 50
      else
        word_score = 0
      end

      letter_array.each do |letter|
        if value_1_array.include?(letter)
          word_score += 1
        elsif value_2_array.include?(letter)
          word_score += 2
        elsif value_3_array.include?(letter)
          word_score += 3
        elsif value_4_array.include?(letter)
          word_score += 4
        elsif value_5_array.include?(letter)
          word_score += 5
        elsif value_8_array.include?(letter)
          word_score += 8
        elsif value_10_array.include?(letter)
          word_score += 10
        end
      end

      return word_score
    end

    def self.highest_score_from(array_of_words)
      # Handle empty input
      if array_of_words.length == 0
        return nil
      end

      scored_words_hash = {}
      winner_hash = {}

      array_of_words.each do |provided_word|
        score = Scrabble::Scoring.score(provided_word)
        scored_words_hash[provided_word] = score
      end

      # highest score values
      highest_score_array = scored_words_hash.max_by{|provided_word,score| score}
      puts "This is the highest score value: #{highest_score_array[1]}"
      highest_score_value = highest_score_array[1]

      # highest scoring words
      highest_scoring_words = scored_words_hash.select{|word,score| score == highest_score_value}
      puts "This is the highest scoring word: #{highest_scoring_words}"

      # Handles tie-breakers
      if highest_scoring_words.length > 1
        winner_hash = highest_scoring_words.select{|word| word.length == 7}
        if winner_hash.empty?
          shortest_winner_hash =  Hash[highest_scoring_words.sort_by {|word, score| word.length}]
          return shortest_winner_hash.keys[0]
        end
      else
        return highest_score_array[0]
      end

    end # self.highest_score_from
  end # class Scoring
end # module Scrabble
