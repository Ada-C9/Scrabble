module Scrabble

  class Scoring
    SCORING_RUBRIK =  {'aeioulnrst'=> 1,
      'dg'=>        2,
      'bcmp' =>    3,
      'fhavwy'=>      4,
      'k'=>           5,
      'jx'=>          8,
      'qz'=>          10,
    }
    def self.score(word)


      word_score = 0

      #for each has key
      n = 0
      word.downcase.each_char do |letter|
        letter = letter
        SCORING_RUBRIK.each do |k,v|
          key_string = k.to_s
          if key_string.include? letter
            word_score += v
            n+=1
          end
        end
        return word_score
      end

      if n != word.length
        return nil
      end
      return word_score

    end

    def self.highest_score_from(array_of_words)

      if array_of_words.empty?
        return nil
      else
        highest_score = -1
        highest_word = array_of_words.first
        array_of_words.each do |word|
          score = self.score(word)
          if score > highest_score
            highest_word = word
            highest_score = score
          elsif score == highest_score
            highest_word = self.break_tie(word, highest_word)
          end
        end
        return highest_word
      end
      #return highest_scoring_word

    end

    def self.break_tie(incumbent, challenger)
      if incumbent.length == 7
        return incumbent
      elsif challenger.length == 7
        return challenger
      elsif challenger.length > incumbent.length
        return incumbent
      elsif challenger.length < incumbent.length
        return  challenger
      elsif incumbent.length == challenger.length
        return incumbent
      end

    end

    # def highest_word_score
    #   word_scores = []
    #
    #   @words_played.each do |word|
    #     score = Scrabble::Scoring.score(word)
    #     word_scores << score
    #   end
    #
    #   return word_scores.max
    # end

  end # class Scoring
end # module Scrabble


#puts  score_word = Scrabble::Scoring.highest_score_from(['pie', 'long', 'dig'])
