module Scrabble
  class Player

    attr_reader :name, :player_score, :plays

    def initialize(player_name)
      @name = player_name
      @player_score = 0
      @plays = []
    end


    def play(word)
      if @player_score > 100
        return false
      end

      @plays << word

      score = Scrabble::Scoring.score(word)
      @player_score += score.to_i

      return score
    end

    # def play(word)
    #   if @player_score >= 100
    #     return false
    #   end
    #
    #   score = Scrabble::Scoring.score(word)
    #
    #   unless score.nil?
    #     @plays << word
    #     @player_score += score
    #   end
    #
    #   return score
    # end

    def won?
        @player_score > 100 ? true : false

    end

    def highest_scoring_word

      highest_scoring_words = []
      max = 0

      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        if score.to_i > max
          highest_scoring_words << word
          max = score
        end
      end
      return highest_scoring_words[-1]

    end

    def highest_word_score
      max = 0

      @plays.each do |word|
        score = Scrabble::Scoring.score(word)
        if score.to_i > max
          max = score
        end
      end
      return max
    end

  end
end
