require_relative "./scoring.rb"
include Scrabble


class Player < Scrabble::Scoring

  attr_reader :name

  # name: returns the value of the @name instance variable
  def initialize(name)
    @name = name
    @plays = 0
    @won == false
  end


  # plays: returns an Array of the words played by the player
  def plays
    highest_score_array
  end


  # play(word): Adds the input word to the plays Array
  # Returns false if player has already won
  # Otherwise returns the score of the word
  def play(word)
    # must add input into plays array
    # if score reaches 100, then exit out

    # if they've already won, returns false
    if won == true
      return false
    end
    return score = scored_words_hash[provided_word]

    # call highest_score_from method here 
  end


  # total_score: Returns the sum of scores of played words
  def total_score
    if score > 100
      won == true
      # and somehow exit game
    end


    # this method interacts with play method

    # output score for loser

    # output score for winner

  end


  #won?: If the player has over 100 points, returns true, otherwise returns false
  def won?

  end


  #highest_scoring_word: Returns the highest scoring played word
  def highest_scoring_word

  end


  # highest_word_score: Returns the highest_scoring_word score
  def highest_word_score

  end



end # class Player

# The constructor for Scrabble::Player should take exactly one argument: the player's name. Instances of the class should respond to the following messages:

# Returns false if player has already won
# Otherwise returns the score of the word
#
#
#
