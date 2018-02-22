require_relative "scoring.rb"

module Scrabble
  class Player
    attr_reader :name, :words_played, :scores
    def initialize(name)
      @name = name.to_s
      @words_played = []
      @score = 0
    end

    def plays
      return @words_played
    end

    def play(word)
      @words_played << word
      word_score = Scoring.score(word)
      @score += word_score
      if won? == true
        return false
      else
        return word_score
      end
    end

      def total_score
        return @score
      end

      def won?
        if total_score > 100
          return true
        else
          return false
        end
      end

      def highest_scoring_word
        return Scoring.highest_score_from(@words_played)
      end

      def highest_word_score
        return Scoring.score(highest_scoring_word)
      end

    end
  end

  # player_1 = Scrabble::Player.new("Dan")
  # puts "#{player_1.play("zzzzffd")}"
  # puts "#{player_1.scores.sum}"
  # word = "xx"
  # player_1.play(word)
  # puts "#{player_1.scores.sum}"
