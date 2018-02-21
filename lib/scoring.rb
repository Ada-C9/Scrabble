module Scrabble
  class Scoring



    def self.score(word)
      if word =~ /[\W+]/ || word =~ /[\s+]/ || word == "" || word =~ /.{8,}$/
        return nil
      elsif word.length == 7
        total_score = 50
      else
        total_score = 0
      end

      letters_groups = [/[AaEeIiOoUuLlNnRrSsTt]/, /[DdGg]/, /[BbCcMmPp]/, /[FfHhVvWwYy]/, /[Kk]/, /[JjXx]/, /[QqZz]/]
      point_options = [1, 2, 3, 4, 5, 8, 10]
      letters_groups.each_with_index do |group, index|
        matches = []

        matches = word.scan(group)

        score = matches.length * point_options[index]
        total_score += score
      end
      return total_score
    end

    def self.highest_score_from(array_of_words)
      return nil if array_of_words.empty?
      array_of_scores = []
      index_for_max = []
      words_with_max = []
      array_of_words.each do |word|
        array_of_scores << score(word)
      end
      array_of_scores.each_with_index do |score, index|
        if score == array_of_scores.max
          words_with_max << array_of_words[index]
        end
      end

      puts "words_with_max"
      puts words_with_max.inspect

      if words_with_max.length > 1

        words_with_max.each {|word| return word if word.length == 7}

        least_letters = []
        start_value = words_with_max[0].length
        least_letters << words_with_max[0]
        words_with_max.each do |word|
          if word == words_with_max[0]
            next
          else
            if start_value > word.length
              least_letters << word
            end
          end
        end
        return least_letters[-1]
      end

      return words_with_max[0]
    end
  end
end


Scrabble::Scoring.score("bacon")
