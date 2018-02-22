require_relative "scoring.rb"

module Scrabble
  class Player
    attr_reader :name, :words_played, :scores
    def initialize(name)
      @name = name.to_s
      @words_played = []
      @scores = []
    end

    def plays
      return @words_played
    end

    def play(word)
      if Player.won?
        return false
      else
        @words_played << word
        word_score = Scoring.score(word)
        @scores << word_score
        return word_score
      end
    end

      def total_score
        return @scores.sum
      end

      def won?
        if Player.total_score > 100
          return true
        else
          return false
        end
      end

      def highest_scoring_word
      end

      def highest_word_score
      end

    end
  end
