require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'pry'

require_relative '../lib/player'

# Get that nice colorized output
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Player' do

  describe 'initialize' do

    it "Takes a player name" do
    end

    it "Can return player name" do
    end

  end

  describe 'play(word)' do

    it "Adds the input word to the plays array" do

    end

    it "Returns false if player has already won" do

    end

    it "Returns score of word if player has not already won" do

    end

  end

  describe 'total_score' do

    it "Returns the sum of scores of played words" do

    end

  end

  describe 'won?' do

    it "Returns true if the player has over 100 points" do
    end

    it "Returns false if player has less than 100 points" do

    end

  end

  describe 'highest_scoring_word' do

    it "Returns the highest scoring played word" do

    end

  end

  describe 'highest_word_score' do

    it "Returns the highest_scoring_word score" do

    end

  end

end
