require 'awesome_print'
require 'pry'
require_relative 'scoring'

module Scrabble
  class Player < Scoring

    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @played_words = []
    end

    def play(word)
      @played_words << word
      return Scrabble::Scoring.score(word)
    end

    def total_score
      
    end


  end

end
