require 'awesome_print'
MAX_NUM_OF_TILES_ALLOWED = 7

module Scrabble
  class Player
    attr_reader :name, :players_plaque
    attr_writer :players_plaque
    
    def initialize(name)
      @name = name
      @array_of_words = []
      @players_plaque = []
    end

    # Returns array of players tiles.
    def tiles
      return @players_plaque
    end

    # Draws tiles from a TileBag to fill player's plaque.
    def draw_tiles(tile_bag)
      if @players_plaque.length < MAX_NUM_OF_TILES_ALLOWED
        add_tiles = MAX_NUM_OF_TILES_ALLOWED  - @players_plaque.length
        @players_plaque.concat(tile_bag.draw_tiles(add_tiles))
      end
    end

    # Returns an array of the words played by the user.
    def plays
      return @array_of_words
    end

    # Adds the input word to the plays array
    def play(word)
      player_status = false
      total_score = 0
      @array_of_words.each do |word_in_arr|
        total_score += Scrabble::Scoring.score(word_in_arr)
      end

      if total_score <  100
        word_score = Scrabble::Scoring.score(word)
        player_status = word_score
        @array_of_words << word
      end

      return player_status
    end

    # Returns the sum of scores of played words
    def total_score
      sum = 0
      @array_of_words.each do |a_word|
        sum+= Scrabble::Scoring.score(a_word)
      end
      return sum
    end

    # If the player has over 100 points, returns true, otherwise returns false
    def won?
      player_case = false
      if total_score >= 100
        player_case = true
      end
      return player_case
    end

    # Returns the highest scoring played word
    def highest_scoring_word
      highest_scoring_word = Scrabble::Scoring.highest_score_from(@array_of_words)

      return highest_scoring_word
    end

    # Returns the highest_scoring_word score
    def highest_word_score
      return highest_scoring_value = Scrabble::Scoring.score(highest_scoring_word)
    end

  end
end
