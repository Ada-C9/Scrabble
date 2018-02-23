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
      Scrabble::Player.new.name.must_equal 'Gordon'
    end

    xit '' do

    end
  end

  describe 'play' do
    it 'it can return an array' do
      Scrabble::Player.new.plays(@played_words).must_be_instance_of Array
    end

    xit '' do

    end
  end

  xdescribe 'play(word)' do
    # Feedback mentions testing edge cases for this method
    xit '' do

    end

    xit '' do

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
