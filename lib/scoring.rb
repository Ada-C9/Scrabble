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
            n += 1
          end
        end
      end


      if n < word.length
        puts "Sorry not a letter"
        return nil
      end
      return word_score

    end

  end # class Scoring
end # module Scrabble


# score_word = Scrabble::Scoring.score('pie')
