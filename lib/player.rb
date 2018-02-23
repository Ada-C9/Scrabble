require_relative "./scoring.rb"

class Player

  attr_reader :name

  attr_accessor :won, :plays

  # name: returns the value of the @name instance variable
  def initialize(name)
    @name = name
    @plays = []
    @won = false
  end

  # WE DON'T NEED THIS METHOD!!!
  # plays: returns an Array of the words played by the player
  # def plays
  # end


  # Adds the input word to the plays Array
  # Returns false if player has already won
  # Otherwise returns the score of the word
  def play(word)
    return false if won?
    # if haven't won, add word to list of plays
    @plays << word
    Scoring.score(word)
  end


  # total_score: Returns the sum of scores of played words
  def total_score
    scores = @plays.map do |word|
      Scoring.score(word)
    end
    return scores.sum
  end
  #
  #
  #   # this method interacts with play method
  #
  #   # output score for loser
  #
  #   # output score for winner
  #
  # end
  #
  #
  # #won?: If the player has over 100 points, returns true, otherwise returns false
  def won?
    return total_score > 100
  end
  #
  #
  # #highest_scoring_word: Returns the highest scoring played word
  def highest_scoring_word
    Scoring.highest_score_from
  end


  # # highest_word_score: Returns the highest_scoring_word score
  # def highest_word_score
  #
  # end
  #


end # class Player

# The constructor for Scrabble::Player should take exactly one argument: the player's name. Instances of the class should respond to the following messages:

# Returns false if player has already won
# Otherwise returns the score of the word
#
#

ada = Player.new("Ada")
puts ada
