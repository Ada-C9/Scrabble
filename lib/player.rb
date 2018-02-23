require_relative "./scoring.rb"

module Scrabble
class Player

  attr_reader :name

  attr_accessor :won, :plays

  # name: returns the value of the @name instance variable
  def initialize(name)
    @name = name
    @plays = []
    # @won = false
  end

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
    p @plays
    scores = @plays.map do |word|
      puts "Scoring word: #{word.inspect}"
      Scoring.score(word)
    end
    p scores
    p scores.sum.class
    return scores.sum
  end

  def won?
    return total_score > 100
  end

  def highest_scoring_word
    Scoring.highest_score_from
  end


  # # highest_word_score: Returns the highest_scoring_word score
  # def highest_word_score
  #
  # end
  #


end # class Player
end






# puts ada
