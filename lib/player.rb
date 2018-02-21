require 'awesome_print'
require 'pry'
require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name, :plays

    def initialize(name)
      @name = name
      @plays = []
    end

    def play(word)
      @plays << word
      word =
    end

  end

end
