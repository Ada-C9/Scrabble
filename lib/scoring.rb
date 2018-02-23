module Scrabble
  class Scoring

    LETTER_VALUES = {
    "A"=> 1 ,"E"=> 1,"I"=> 1,"O"=> 1,"U"=> 1,"L"=> 1,"N"=> 1,"R"=> 1,"S"=> 1,"T"=> 1,
    "D"=> 2, "G"=> 2 , "B"=> 3,"C" => 3, "M" => 3 ,"P" => 3, "F"=> 4,"H"=> 4,"V"=> 4,"W"=> 4,"Y"=> 4,
    "K"=> 5,  "J"=> 8, "X"=>8, "Q"=> 10, "Z"=> 10}

    def self.score(word)
      word_array = word.to_s.upcase.split("")
      if word_array.empty? || word_array.length > 7
        return nil
      end
      word_array.each do |letter|
        return nil if !(LETTER_VALUES.keys.include?(letter))
      end
      score = 0
      word_array.each do |letter|
        score += LETTER_VALUES[letter]
      end
      if word_array.length == 7
        score += 50
      end
      return score

    end

    def self.highest_score_from(array_of_words)
      word_scores_hash = {}
      array_of_words.each do |word|
        word_scores_hash[word.upcase] = self.score(word)
      end
      max_score = word_scores_hash.values.max
      winning_words = []
      word_scores_hash.each do |word, score|
        if score == max_score
          winning_words << word
        end
      end
      if winning_words.any? { |word| word.length == 7 }
        winning_words.select! { |word| word.length == 7}
      end
      winner = winning_words[0]
      winning_words.each do |word|
        if word.length < winner.length
          winner = word
        end
      end
      return winner
    end
  end
end
