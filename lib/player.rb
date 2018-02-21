module Scrabble
  class Player

    attr_reader :name

    def initialize(initial_name)
      @name = provided_valid_name(initial_name)
    end

    def provided_valid_name(name)
      name = "AnnoyingOne" if name.class != String || name.strip.length == 0
      return name
    end
  end
end
