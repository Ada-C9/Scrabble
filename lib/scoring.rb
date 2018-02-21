module Scrabble
  class Scoring



    def self.score(word)

      if  word =~ /[\W+]/ || word =~ /[\s+]/ || word == '' || word =~ /.{8,}$/
        return nil
      elsif word.length == 7
        total_score = 50
      else
        total_score = 0
      end

      letter_groups = [/[AaEeIiOoUuLlNnRrSsTt]/, /[DdGg]/, /[BbCcMmPp]/, /[FfHhVvWwYy]/, /[Kk]/, /[JjXx]/, /[QqZz]/]
      point_options = [ 1, 2, 3, 4, 5, 8, 10 ]

      letter_groups.each.with_index do |group, index|
        matches = []

        matches = word.scan(group)
        score = matches.length * point_options[index]

        total_score += score
      end
      return total_score
    end

    def self.highest_score_from(array_of_words)
    end
  end
end


Scrabble::Scoring.score("bacon")
