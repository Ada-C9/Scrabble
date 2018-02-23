require 'pry'

module Scrabble
  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
    end # initialize



  end # class player

end # module
player = Scrabble::Player.new("Sam")
puts player.name
