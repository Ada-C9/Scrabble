# Kaitlin Forsman and Kirsten Schumy
# Ada Cohort[9], Ampers
# Scrabble Assignment

module Scrabble

  class Player

    attr_reader :name, :plays, :total_score, :tiles

    def initialize(initial_name)
      @name = provided_valid_name(initial_name)
      @plays = [] # store the words the player has played
      @total_score = 0 # stores total points of all the valid words played
      @tiles = [] # stores the available tiles
    end

    # Throws ArgumentError if provided word is invalid according to Scoring.
    # If the player has won, returns 'false'. Otherwise, returns the score of
    # of the provided word.
    def play(word)
      return false if won?
      word_score = Scoring.score(word)
      @plays << word
      @total_score += word_score
      return word_score
    end

    # Returns 'true' is the player's score is greater than or equal to 100.
    # Otherwise, returns 'false'.
    def won?
      return @total_score >= 100
    end

    # Returns highest scoring word of the words the player has played.
    def highest_scoring_word
      return Scoring.highest_score_from(@plays)
    end

    # Returns highest score of the words the player has played.
    def highest_word_score
      return Scoring.get_highest_score(@plays)
    end

    # Pre: Throws ArgumentError if provided tile_bag is not a TileBag.
    # Draws tiles from the provided tile_bag until player's hand has MAX_LETTERS
    # number of tiles.
    def draw_tiles(tile_bag)
      if tile_bag.class != TileBag
        raise ArgumentError.new("#{tile_bag} must be a TileBag")
      end
      # Rules states not allowed to have more than MAX_LETTERS number of tiles.
      if MAX_LETTERS > @tiles.size
        @tiles += tile_bag.draw_tiles(MAX_LETTERS - @tiles.size)
      end
    end

    private

    # Returns provided name if name is a String with a non-empty character
    # length of at least one. Otherwise, returns default name.
    def provided_valid_name(name)
      # There is no significance to the default name.
      name = "AnnoyingOne" if name.class != String || name.strip.length == 0
      return name
    end

  end
end
