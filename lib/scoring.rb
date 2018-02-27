module Scrabble

  class Scoring
    SCORING_RUBRIK =  {
      'a'=> 1,
      'e'=> 1,
      'i'=> 1,
      'o'=> 1,
      'u'=> 1,
      'l'=> 1,
      'n'=> 1,
      'r'=> 1,
      's'=> 1,
      't'=> 1,
      'd'=> 2,
      'g'=> 2,
      'b'=> 3,
      'c'=> 3,
      'm'=> 3,
      'p'=> 3,
      'f'=> 4,
      'h'=> 4,
      'v'=> 4,
      'w'=> 4,
      'y'=> 4,
      'k'=> 5,
      'j'=> 8,
      'x'=> 8,
      'q'=> 10,
      'z'=> 10
    }
    def self.score(word)


      word_score = 0

      #for each has key

      word.downcase.each_char do |letter|
        return nil unless SCORING_RUBRIK.include?(letter)
        word_score += SCORING_RUBRIK[letter]
      end


      if word.length == 7
        word_score += 50
      elsif word.length > 7
        return nil
      elsif word.length == 0
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
            # highest_word =
            self.break_tie(highest_word, word)
          end
        end
        puts "#{highest_word}"
        return highest_word

      end
      #return highest_scoring_word

    end

    def self.break_tie(incumbent, challenger)

      if incumbent.length == 7
        return incumbent
      elsif challenger.length == 7
        return challenger
      end

      if challenger.length > incumbent.length
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


puts score_word = Scrabble::Scoring.score('dog')
