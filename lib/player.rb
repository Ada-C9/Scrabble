require 'awesome_print'
require_relative '../lib/scoring.rb'
require 'pry'
module Scrabble
  class Player
    attr_reader :name, :plays, :total

    def initialize(name)
      @name = name
      @plays = Array.new
      @total = 0
    end

    def play(word)
      @plays << word
    end

    def total_score
    @total = 0

    @plays.each do |word|
      @total += Scrabble::Scoring.score(word)
    end
      return @total
    end
  end
end
