module Scrabble
  class Scoring
    def self.score(word)


      word_score = 0

      word.downcase.each_char do |letter|
        if 'aeioulnrst'.include? letter
          word_score += 1
        elsif 'dg'.include? letter
          word_score += 2
        elsif 'bcmp'.include? letter
          word_score += 3
        elsif 'fhvwy'.include? letter
          word_score += 4
        elsif 'k'.include? letter
          word_score += 5
        elsif 'jx'.include? letter
          word_score += 8
        elsif 'qz'.include? letter
          word_score += 10
        else
          puts "Sorry, not a letter."
          return nil
          #word = gets.chomp
        end

      end

      if word.length == 7
        word_score += 50
      elsif word.length > 7
        return nil
      end

      if word.to_s.empty?
        return nil
      end

      return word_score


    end

    def self.highest_score_from(array_of_words)
    end
  end
end
