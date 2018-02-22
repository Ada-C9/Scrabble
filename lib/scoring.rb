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
      highest_word = array_of_words.first

      array_of_words.each do |word|
        print word
        # if Scrabble::Scoring.score(word) > Scrabble::Scoring.score(highest_word)
        if self.score(word) > self.score(highest_word)
          highest_word = word
        elsif self.score(word) == self.score(highest_word)
            if word.length < highest_word.length
              highest_word = word
            end # inside conditional
        end # outer conditional
      end # each loop

      return highest_word

    end # highest_score_from
  end # class
end
