require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

require_relative '../lib/player'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new


describe 'Player' do
  describe 'name' do
    it 'can return a name' do
      #Arrange
      name = 'Gordon'
      #Act/Assert
      Scrabble::Player.new(name).name.must_equal 'Gordon'
    end

    # xit '' do
    #
    # end
  end

  describe 'plays' do
    it 'it can return an array' do
      Scrabble::Player.new('').plays.must_be_instance_of Array
    end

    # xit '' do
    #
    # end
  end

  describe 'play(word)' do
    # Feedback mentions testing edge cases for this method
    it 'takes word and adds it to the plays array' do
      word = 'batshit'
      @played_words = []
      Scrabble::Player.new('').play(word).must_include 'batshit'
    end

    xit 'returns false if player has already won' do

    end

    xit 'returns score of the word' do

    end
  end

  xdescribe 'total_score' do
    xit '' do

    end

    xit '' do

    end
  end

  xdescribe 'won?' do
    xit '' do

    end

    xit '' do

    end
  end

  xdescribe 'highest_scoring_word' do
    xit '' do

    end

    xit '' do

    end
  end
end
