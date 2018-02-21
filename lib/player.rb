require 'awesome_print'
require 'pry'
require_relative 'scoring'

module Scrabble
  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end

  end

end
